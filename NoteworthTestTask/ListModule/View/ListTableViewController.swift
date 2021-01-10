//
//  ListTableViewController.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListTableViewController: UITableViewController {
  
  private var viewModel = [ListViewModelItem]()
  private let cellReuseIdentifier = "cellReuseIdentifier"
  
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
      cell.title = viewModel[indexPath.row].title
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100.0
  }
}
