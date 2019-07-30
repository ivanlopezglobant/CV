//
//  AppDelegate.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/18/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = AppConstants.Color.white
        navigationBarAppearace.barTintColor = AppConstants.Color.main
        
        let initialConfigurator = InitialLoaderConfigurator()
        let navController = initialConfigurator.createInitialLoaderModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

