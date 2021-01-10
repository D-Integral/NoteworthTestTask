//
//  ApplicationCoordinator.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ApplicationCoordinator: Coordinator {
  
  let window: UIWindow
  let rootViewController: UINavigationController
  
  let listCoordinator: ListCoordinator
  
  init(window: UIWindow) {
    self.window = window
    
    rootViewController = UINavigationController()
    rootViewController.navigationBar.prefersLargeTitles = true
    
    listCoordinator = ListCoordinator(navigationController: rootViewController)
  }
  
  func start() {
    window.rootViewController = rootViewController
    listCoordinator.start()
    window.makeKeyAndVisible()
  }
}
