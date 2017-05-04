//
//  Profile.swift
//  RealmVersionUpSample
//
//  Created by 狩野 恭平 on 2017/05/04.
//  Copyright © 2017年 狩野 恭平. All rights reserved.
//

import Foundation
import RealmSwift

class Profile: Object{
    dynamic var age: Int = 0
    dynamic var address: String = ""
    dynamic var user: User?
}
