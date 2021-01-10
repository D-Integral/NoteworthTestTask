//
//  RedditItem.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import Foundation

struct RedditItem {
  let title: String
  let author: String
  let created_utc: Date
  
  let thumbnail: String
  let thumbnail_height: Double
  let thumbnail_width: Double
  
  let subreddit: String
  let num_comments: Int
  let visited: Bool
  
  init(title: String,
       author: String,
       created_utc: TimeInterval,
       thumbnail: String,
       thumbnail_height: Double,
       thumbnail_width: Double,
       subreddit: String,
       num_comments: Int,
       visited: Bool) {
    self.title = title
    self.author = author
    self.created_utc = Date(timeIntervalSince1970: created_utc)
    
    self.thumbnail = thumbnail
    self.thumbnail_height = thumbnail_height
    self.thumbnail_width = thumbnail_width
    
    self.subreddit = subreddit
    self.num_comments = num_comments
    self.visited = visited
    
    print("Created Reddit item with title \(self.title), author \(self.author), \(self.created_utc).")
  }
}
