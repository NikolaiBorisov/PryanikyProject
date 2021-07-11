//
//  AppDelegate.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupNavBarAppearance()
    return true
  }
  
  // MARK: - Set up the NavBar Appearance
  
  func setupNavBarAppearance() {
    UINavigationBar.appearance().barTintColor = .white
    UINavigationBar.appearance().titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.white,
      NSAttributedString.Key.font: UIFont.nameLabelFont,
    ]
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.nameLabelFont], for: .normal)
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().barTintColor = .systemTeal
  }
  
}

