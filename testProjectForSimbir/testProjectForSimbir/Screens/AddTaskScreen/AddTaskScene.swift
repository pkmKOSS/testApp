//
//  AddTuskScreen.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 10.02.2022.
//

import Foundation
import UIKit

enum AddTaskScene {
   
    static func build(date: Date) -> UIViewController {
        
        let viewController = AddTaskViewController()
        let interactor = AddTaskInteractor()
        let presenter = AddTaskPresenter()
        let router = AddTaskRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        viewController.view.backgroundColor = .white
        viewController.dateOfTask = date
        
        return viewController
    }
}
