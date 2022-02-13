//
//  AddTaskProtocols.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 10.02.2022.
//

import Foundation

protocol AddTaskDisplayLogic {
    func displayData(name: String, date: String, time: String)
}

protocol AddTaskBusinessLogic {
    func uploadData(id: Int,
                    task_time: Date,
                    task_date: Date,
                    name: String,
                    descriptionString: String)
}

protocol AddTaskPresentingLogic {
    func presentData(name: String, date: Date, time: Date)
}

protocol AddTaskRoutingLogic {
    func routTo()
}

protocol AddTaskDataPassing {}

protocol AddTaskDataStore {}
