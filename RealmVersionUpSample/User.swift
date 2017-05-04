//
//  User.swift
//  realm-update-sample
//
//  Created by 狩野 恭平 on 2017/05/04.
//  Copyright © 2017年 狩野 恭平. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object{
    dynamic var id: Int = 1
    dynamic var name: String = "no name"
    dynamic var createdAt: String = ""
    dynamic var profile: Profile?
    
    override static func primaryKey() -> String?{
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["name"]
    }
}
