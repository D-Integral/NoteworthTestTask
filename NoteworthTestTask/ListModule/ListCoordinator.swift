//
//  ListCoordinator.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListCoordinator: Coordinator {
  private let navigationController: UINavigationController
  private var listViewController: ListTableViewController?
  private let interactor: ListInteractor
  private let presenter: ListPresenter

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    
    self.interactor = ListInteractor()
    self.presenter = ListPresenter()
  }

  func start() {
    let listTableViewController = ListTableViewController(nibName: nil, bundle: nil)
    
    listTableViewController.title = "List"
    navigationController.pushViewController(listTableViewController, animated: true)

    self.listViewController = listTableViewController
  }
}
