//
//  RealmManager.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 10.02.2022.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    init(){}
    
    let localRealm = try! Realm()

    func saveTaskRealmModel(model: TaskRealmModel){
        try! localRealm.write{
            localRealm.add(model)
            print("saveTaskRealmModel")
            print("saveTaskRealmModel")
            print("saveTaskRealmModel")
            print("saveTaskRealmModel")
            print("saveTaskRealmModel")
        }
    }
}
