//
//  ListData.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import Foundation

struct ListData: Codable {
  let modhash: String
  let children: [ListChild]
  
  let after: String
}
