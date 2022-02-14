//
//  CalendarProtocols.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 07.02.2022.
//

import Foundation

protocol CalendarDisplayLigic {
    func displayData(array: [TaskRealmModel])
}

protocol CalendarBusinessLogic {
    func fetchData()
}

protocol CalendarPresentingLogic {
    func presentData(array: [TaskRealmModel])
}

protocol CalendarRoutingLogic {
    func routToDetail(task_date: String)
    func routToAddTuskScreen(date: Date)
}

protocol CalendarDataPassingLogic: AnyObject {
    var dataStore: CalendarDataStore? { get }
}

protocol CalendarDataStore {
    var model: [String: TaskRealmModel]? { get }
}
