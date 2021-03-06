//
//  CalendarInteractor.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 07.02.2022.
//

import Foundation

class CalendarInteractor: CalendarDataStore {   
    // MARK: - External vars
    var presenter: CalendarPresentingLogic?
    
    // MARK: - Internal vars
    private let dateFormater = DateFormatter()
    
    // MARK: - Data store
    private(set) var model: [String: TaskRealmModel]?
    private var arrayForPresent = [TaskRealmModel]()
}

extension CalendarInteractor: CalendarBusinessLogic {
    func fetchData() {
        var dict = [String: TaskRealmModel]()

        dateFormater.dateFormat = "yyyy:MM:dd"
        dateFormater.locale = Locale.current
        
        arrayForPresent.append(contentsOf: RealmManager.shared.localRealm.objects(TaskRealmModel.self))
        for item in arrayForPresent {
            let key =  String("\(item.id)")
            dict[key] = item
            model = dict
        }
        presenter?.presentData(array: arrayForPresent)
    }
}

