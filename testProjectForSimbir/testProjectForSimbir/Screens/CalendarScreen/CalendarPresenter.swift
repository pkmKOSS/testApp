//
//  CalendarPresenter.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 07.02.2022.
//

import Foundation

class CalendarPresenter {
    // MARK: - External vars
    var viewController: CalendarDisplayLigic?
    var dictionary = [String: TaskRealmModel]()
}

extension CalendarPresenter: CalendarPresentingLogic {
    func presentData(array: [TaskRealmModel]) {
        
        let dateFormatterForCell = DateFormatter()
        dateFormatterForCell.locale = NSLocale.current
        dateFormatterForCell.dateFormat = "HH"

        let dateFormatterForDictionary = DateFormatter()
        dateFormatterForDictionary.locale = NSLocale.current
        dateFormatterForDictionary.dateFormat = "yyyy:MM:dd"
        
        for item in array {
            let task = TaskRealmModel()

            guard let date = Double(item.task_date) else { return }
            let key = dateFormatterForDictionary.string(from: Date(timeIntervalSince1970: date))
            
            guard let time = Double(item.task_time) else { return }
            task.task_time = dateFormatterForCell.string(from: Date(timeIntervalSince1970: time))
            task.task_date = dateFormatterForDictionary.string(from: Date(timeIntervalSince1970: date))
            task.id = item.id
            task.descriptionString = item.descriptionString
            task.name = item.name
            
            dictionary[key] = task
        }
        viewController?.displayData(array: dictionary)
    }
}




