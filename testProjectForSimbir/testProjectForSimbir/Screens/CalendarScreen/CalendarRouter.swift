//
//  CalendarRouter.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 07.02.2022.
//

import Foundation
import UIKit

class CalendarRouter: CalendarDataPassingLogic {
    // MARK: - External vars
    weak var viewController: UIViewController?
    var dataStore: CalendarDataStore?
}

extension CalendarRouter: CalendarRoutingLogic {
    func routToDetail(task_date: String) {
        guard let store = self.dataStore?.model![task_date] else { return }
            let vc = DetailsScene.build(task: store)
            self.viewController?.present(vc, animated: true, completion: nil)
    }
    
    func routToAddTuskScreen(date: Date){
        let vc = AddTaskScene.build(date: date)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
