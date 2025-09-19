//
//  UserRepository.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 19/09/25.
//

import Foundation
import RealmSwift

final class UserRepository {
    private let realm: Realm
    
    init() {
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 2 {
                    migration.enumerateObjects(ofType: User.className()) { _, newObject in
                        newObject?["mobile"] = ""
                        newObject?["location"] = ""
                    }
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
        self.realm = try! Realm()
    }
    
    func addUser(_ user: User) {
        try! realm.write {
            realm.add(user)
        }
    }
    
    func authenticateUser(email: String, password: String) -> User? {
        return realm.objects(User.self)
            .filter("email == %@ AND password == %@", email, password)
            .first
    }
    
    func fetchUser(byEmail email: String) -> User? {
        return realm.objects(User.self)
            .filter("email == %@", email)
            .first
    }
    
    func isEmailTaken(_ email: String) -> Bool {
        return realm.objects(User.self).filter("email == %@", email).first != nil
    }
    
    func updateUser(_ user: User, fullname: String, username: String, mobile: String, location: String) throws {
        do {
            try realm.write {
                user.fullname = fullname
                user.username = username
                user.mobile = mobile
                user.location = location
            }
        } catch {
            throw error
        }
    }
}
