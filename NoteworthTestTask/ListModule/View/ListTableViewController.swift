//
//  ListTableViewController.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

protocol ListViewControllerDelegate: class {
  func listViewControllerDidSelectViewModel(_ viewModel: ListViewModelItem)
}

class ListTableViewController: UITableViewController {
  
  private var viewModel = [ListViewModelItem]()
  private let cellReuseIdentifier = "cellReuseIdentifier"
  
  let multicastDelegate = MulticastDelegate<ListViewControllerDelegate>()
  
  func update(withViewModel newViewModel: [ListViewModelItem]) {
    self.viewModel = newViewModel
    
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      
      self.tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(ListItemTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
  }
  
  public func addListener(_ listener: ListViewControllerDelegate) {
    multicastDelegate.addDelegate(listener)
  }
  
  
  public func removeListener(_ listener: ListViewControllerDelegate) {
    multicastDelegate.removeDelegate(listener)
  }
  
  private func didSelectViewModelItem(at indexPath: IndexPath) {
    let viewModelItem = self.viewModel[indexPath.row]
    
    multicastDelegate.invokeDelegates { listener in
      listener.listViewControllerDidSelectViewModel(viewModelItem)
    }
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
    
    if let cell = cell as? ListItemTableViewCell {
      cell.viewModel = viewModel[indexPath.row]
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100.0
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    didSelectViewModelItem(at: indexPath)
  }
}
