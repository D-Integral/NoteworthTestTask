//
//  ItemDetailsViewController.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 11.01.2021.
//

import UIKit

class ItemDetailsViewController: UIViewController {
  
  private var contentView: ListItemContentView?
  
  var viewModel: ListViewModelItem? {
    didSet {
      contentView?.viewModel = viewModel
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.contentView = ListItemContentView(frame: self.view.frame)
    contentView?.viewModel = viewModel
    setupContentView()
  }
  
  private func setupContentView() {
    guard let contentView = self.contentView else {
      print("The content view of the item details doesn't exist at the moment when we are trying to setup it.")
      return
    }
    
    self.view.addSubview(contentView)
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    contentView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    contentView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
  }
}
