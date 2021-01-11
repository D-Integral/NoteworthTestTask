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
      self.update()
    }
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func update() {
    if nil == self.contentView {
      self.contentView = ListItemContentView(frame: self.view.frame)
      setupContentView()
    }
    
    contentView?.viewModel = viewModel
  }
  
  private func setupContentView() {
    guard let contentView = self.contentView else {
      print("The content view of the item details doesn't exist at the moment when we are trying to setup it.")
      return
    }

    let middleView = UIView()
    
    middleView.addSubview(contentView)

    contentView.translatesAutoresizingMaskIntoConstraints = false

    contentView.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 200.0).isActive = true
    contentView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: middleView.bottomAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor).isActive = true
    
    self.view.addSubview(middleView)
    
    middleView.frame = self.view.frame
    middleView.backgroundColor = .white
    self.view.backgroundColor = .white
  }
}
