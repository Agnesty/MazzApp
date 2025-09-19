//
//  UserRealm.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 19/09/25.
//

//import Foundation
//import RealmSwift
//
//class User: Object, Identifiable {
//    @objc dynamic var id: ObjectId = ObjectId.generate()
//    @objc dynamic var fullname: String = ""
//    @objc dynamic var username: String = ""
//    @objc dynamic var email: String = ""
//    @objc dynamic var password: String = ""
//    
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//}

import Foundation
import RealmSwift

class User: Object, Identifiable {
    @objc dynamic var id: ObjectId = ObjectId.generate()
    @objc dynamic var fullname: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    
    // Tambahan, default kosong
    @objc dynamic var mobile: String = ""
    @objc dynamic var location: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
