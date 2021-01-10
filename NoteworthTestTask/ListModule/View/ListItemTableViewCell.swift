//
//  ListItemTableViewCell.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
  private let titleTextView: UITextView
  
  var title: String? {
    didSet {
      titleTextView.text = title
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    self.titleTextView = UITextView()
    
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupTitleTextView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    title = nil
  }
  
  private func setupTitleTextView() {
    self.contentView.addSubview(self.titleTextView)
    
    self.titleTextView.translatesAutoresizingMaskIntoConstraints = false
    
    self.titleTextView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
    self.titleTextView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
    self.titleTextView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    self.titleTextView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
  }
}
