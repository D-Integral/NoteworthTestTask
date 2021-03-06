//
//  ListItemContentView.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 11.01.2021.
//

import UIKit

class ListItemContentView: UIView {
  
  private let authorLabel: UILabel
  private let timeAgoLabel: UILabel
  private let titleTextView: UITextView
  
  var viewModel: ListViewModelItem? {
    didSet {
      authorLabel.text = viewModel?.author
      timeAgoLabel.text = viewModel?.created
      titleTextView.text = viewModel?.title
    }
  }

  override init(frame: CGRect) {
    self.authorLabel = UILabel()
    self.timeAgoLabel = UILabel()
    self.titleTextView = UITextView()
    
    super.init(frame: frame)
    
    setupAuthorLabel()
    setupTimeAgoLabel()
    setupTitleTextView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupAuthorLabel() {
    self.addSubview(self.authorLabel)
    
    self.authorLabel.translatesAutoresizingMaskIntoConstraints = false
    
    self.authorLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    self.authorLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    self.authorLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
  }
  
  private func setupTimeAgoLabel() {
    self.addSubview(self.timeAgoLabel)
    
    self.timeAgoLabel.translatesAutoresizingMaskIntoConstraints = false
    
    self.timeAgoLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.timeAgoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    self.timeAgoLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    self.timeAgoLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
  }
  
  private func setupTitleTextView() {
    self.addSubview(self.titleTextView)
    
    self.titleTextView.translatesAutoresizingMaskIntoConstraints = false
    
    self.titleTextView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor).isActive = true
    self.titleTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    self.titleTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    self.titleTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    
    self.titleTextView.isUserInteractionEnabled = false
  }

}
