//
//  CalendarScene.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 07.02.2022.
//

import Foundation
import UIKit

enum CalendarScene {
  static func build()-> UIViewController {
        let viewController = CalendarViewController()
        let interactor = CalendarInteractor()
        let presenter = CalendarPresenter()
        let router = CalendarRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
