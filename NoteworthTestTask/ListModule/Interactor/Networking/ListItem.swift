//
//  ListItem.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import Foundation

struct ListItem: Codable {
  let title: String
  let author: String
  let created_utc: TimeInterval
  
  let thumbnail: String
  let thumbnail_height: Double
  let thumbnail_width: Double
  
  let subreddit: String
  let num_comments: Int
  let visited: Bool
}
