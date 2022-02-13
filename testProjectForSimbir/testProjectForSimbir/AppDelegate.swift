//
//  AppDelegate.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 04.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let calendarVC = CalendarScene.build()
        self.navController = UINavigationController(rootViewController: calendarVC)
        
        self.window?.rootViewController = self.navController
        self.window?.makeKeyAndVisible()

        return true
    }
}

