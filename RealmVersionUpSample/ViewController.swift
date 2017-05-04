//
//  ViewController.swift
//  RealmVersionUpSample
//
//  Created by 狩野 恭平 on 2017/05/04.
//  Copyright © 2017年 狩野 恭平. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let config = Realm.Configuration(schemaVersion: 2)
        Realm.Configuration.defaultConfiguration = config
        
        let realm = try! Realm()

        // find
        let allUser = realm.objects(User.self)

        // save
        let newUser = User()
        newUser.id = allUser.count + 1
        newUser.createdAt = String(describing: Date())
        let newUserProfile = Profile()
        newUserProfile.age = 30
        newUserProfile.address = "jp Tokyo"
        newUser.profile = newUserProfile
        try! realm.write {
            realm.add(newUser)
        }
        
        // update
        let updateUsers = realm.objects(User.self)
        if let updateUser = updateUsers.first {
            try! realm.write {
                updateUser.createdAt = String(describing: Date())
            }
        }
        
        // delete
        let deleteUsers = realm.objects(User.self)
        if let deleteUser = deleteUsers.last {
            try! realm.write {
                if let profile = deleteUser.profile {
                    realm.delete(profile)
                }
                realm.delete(deleteUser)
                
            }
        }

        // notification
        _ = realm.objects(User.self).filter("id > 0").addNotificationBlock { (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let logs):
                print("initiali logs : \(logs)")
                break
            case .update(let logs, _, _, _):
                print("update logs \(logs)")
                break
            case .error:
                print("error")
                break
            }
        }
        
        print(realm.objects(User))
        print(realm.objects(Profile))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

