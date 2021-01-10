//
//  ListNetworkingService.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import Foundation

class ListNetworkingService {
  
  let basePath: String = "https://www.reddit.com/r/all/top/.json?t=all"
  let limitPathComponent: String = "limit"
  let limit: Int = 10
  let afterPathComponent: String = "after"
  
  func requestList(after: String? = nil,
                   _ completionHandler: @escaping (ListPage) -> Void) {
    DispatchQueue.global().async { [weak self] in
      guard let self = self else { return }
      
      self.listDataTask(after: after,
                        completionHandler)?.resume()
    }
  }
  
  private func listDataTask(after: String? = nil,
                            _ completionHandler: @escaping (ListPage) -> Void) -> URLSessionDataTask? {
    let request = listRequest(after: after)
    
    if let request = request {
      
      return URLSession.shared.dataTask(with:request, completionHandler: {(data, response, error) in
        if let error = error {
          print("Error \(error)")
          
          return
        }
        
        guard let data = data else {
          print("The data object is nil")
          
          return
        }
        
        let decoder = JSONDecoder()
        if let listPage = try? decoder.decode(ListPage.self, from: data) {
          completionHandler(listPage)
        }
      })
    }
    
    return nil
  }
  
  private func listRequest(after: String? = nil) -> URLRequest? {
    var urlComponents = URLComponents(string: basePath)
    urlComponents?.queryItems = [
      URLQueryItem(name: limitPathComponent, value: String(limit))
    ]
    
    if let after = after {
      urlComponents?.queryItems?.append(URLQueryItem(name: afterPathComponent, value: after))
    }
    
    if let url = urlComponents?.url {
      var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
      request.httpMethod = "GET"
      request.allHTTPHeaderFields = ["content-type": "application/json"]
      
      return request
    }
    
    return nil
  }
}
