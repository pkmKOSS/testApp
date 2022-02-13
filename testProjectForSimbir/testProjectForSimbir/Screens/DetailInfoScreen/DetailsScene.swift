//
//  DetailsScene.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 09.02.2022.
//

import Foundation
import UIKit


enum DetailsScene {
    static func build(task: TaskRealmModel) -> UIViewController {
        let viewController = DetailInformationsViewController()
        
        let dateFormatterForDay = DateFormatter()
        dateFormatterForDay.locale = NSLocale.current
        dateFormatterForDay.dateFormat = "dd.MM.yy"
        
        let dateFormatterForHour = DateFormatter()
        dateFormatterForHour.locale = NSLocale.current
        dateFormatterForHour.dateFormat = "HH"
        
        if Double(task.task_time) != nil {
            let spacingForDescriptionLabel = " "

            viewController.nameLabel.text = task.name
            viewController.descriptionLabel.text = spacingForDescriptionLabel + task.descriptionString
            viewController.dateAndTimeLabel.text = "\(dateFormatterForDay.string(from: Date(timeIntervalSince1970: Double(task.task_time)!))) - \(dateFormatterForHour.string(from: Date(timeIntervalSince1970: Double(task.task_time)!))):00"
        }
        
        return viewController
    }
}
