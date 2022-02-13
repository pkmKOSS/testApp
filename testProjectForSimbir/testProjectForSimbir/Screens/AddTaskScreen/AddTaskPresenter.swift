//
//  AddTaskPresenter.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 10.02.2022.
//

import Foundation

class AddTaskPresenter {
    // MARK: - Internak vars
    var dateFormaterForDate = DateFormatter()
    var dateFormaterForTime = DateFormatter()

    // MARK: - External vars
    var viewController: AddTaskDisplayLogic?
}

extension AddTaskPresenter: AddTaskPresentingLogic {
    func presentData(name: String, date: Date, time: Date) {
        
        dateFormaterForDate.dateFormat = "dd:MM:yyyy"
        dateFormaterForDate.locale = Locale.current
        
        dateFormaterForTime.dateFormat = "hh:mm"
        dateFormaterForTime.locale = Locale.current
        
        let dateForDisplay = dateFormaterForDate.string(from: date)
        let timeForDisplay = dateFormaterForTime.string(from: time)
        
        viewController?.displayData(name: name, date: dateForDisplay, time: timeForDisplay)
    }
}
