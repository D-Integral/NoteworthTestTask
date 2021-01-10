//
//  ListViewModelItem.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import Foundation

struct ListViewModelItem {
  let title: String
  let author: String
  let created: String
  
  let thumbnail: String
  let thumbnail_height: Double
  let thumbnail_width: Double
  
  let subreddit: String
  let num_comments: Int
  let visited: Bool
}
