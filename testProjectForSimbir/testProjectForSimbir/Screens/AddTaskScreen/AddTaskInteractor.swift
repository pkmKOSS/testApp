//
//  Interactor.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 10.02.2022.
//

import Foundation

class AddTaskInteractor {
    // MARK: - External vars
    var presenter: AddTaskPresentingLogic?
}

extension AddTaskInteractor: AddTaskBusinessLogic {
    func uploadData(id: Int,
                    task_time: Date,
                    task_date: Date,
                    name: String,
                    descriptionString: String) {
        
        let task = TaskRealmModel()
        task.id = id
        task.task_time = "\(Int64(task_time.timeIntervalSince1970))"
        task.task_date = "\(Int64(task_date.timeIntervalSince1970))"
        task.name = name
        task.descriptionString = descriptionString
                
        RealmManager.shared.saveTaskRealmModel(model: task)
        presenter?.presentData(name: name, date: task_date, time: task_time)
    }
}
