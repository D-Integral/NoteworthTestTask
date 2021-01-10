//
//  ListItemTableViewCell.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
  private let cellContentView: ListItemCellContentView
  
  var viewModel: ListViewModelItem? {
    didSet {
      cellContentView.viewModel = viewModel
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    self.cellContentView = ListItemCellContentView(frame: CGRect.zero)
    
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupCellContentView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    viewModel = nil
  }
  
  private func setupCellContentView() {
    self.contentView.addSubview(self.cellContentView)
    
    self.cellContentView.translatesAutoresizingMaskIntoConstraints = false
    
    self.cellContentView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
    self.cellContentView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
    self.cellContentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    self.cellContentView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
  }
}
