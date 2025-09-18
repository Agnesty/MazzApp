//
//  APIService.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import Foundation
import Alamofire
import Combine

final class APIClient {
    static let shared = APIClient()
    private init() {}
    
    // MARK: - Versi URLSession + Combine
    func requestWithCombine<T: Decodable>(_ endpoint: APIEndpoint, type: T.Type) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: endpoint.urlRequest)
            .map(\.data)
            .handleEvents(receiveOutput: { data in
                if let raw = String(data: data, encoding: .utf8) {
                    print("📥 Raw response:\n\(raw)")
                }
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                switch error {
                case is DecodingError:
                    return APIError.decoding
                case let urlError as URLError:
                    return APIError.network(urlError)
                default:
                    return APIError.unknown
                }
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Versi Alamofire + Combine
    func requestWithAlamofire<T: Decodable>(_ endpoint: APIEndpoint, type: T.Type) -> AnyPublisher<T, Error> {
        Future<T, Error> { promise in
            AF.request(endpoint.urlRequest)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        promise(.failure(APIError.network(error)))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}
