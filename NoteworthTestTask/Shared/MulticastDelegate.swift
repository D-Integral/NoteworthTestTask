//
//  MulticastDelegate.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 11.01.2021.
//

public final class MulticastDelegate<ProtocolType> {
  
  // MARK: - DelegateWrapper
  private class DelegateWrapper {
    weak var delegate: AnyObject?
    
    init(_ delegate: AnyObject) {
      self.delegate = delegate
    }
  }
  
  // MARK: - Instance Properties
  private var delegateWrappers: [DelegateWrapper]
  
  var delegates: [ProtocolType] {
    let delegates = delegateWrappers.compactMap{ $0.delegate } as? [ProtocolType]
    
    if let delegates = delegates {
      return delegates
    } else {
      debugPrint("Error. It has been impossible to instanciate a delegates array by a MulticastDelegate. An empty array will be returned.")
      return []
    }
  }
  
  // MARK: - Object Lifecycle
  init(delegates: [ProtocolType] = []) {
    delegateWrappers = delegates.map {
      DelegateWrapper($0 as AnyObject)
    }
  }
  
  // MARK: - Delegate Management
  func addDelegate(_ delegate: ProtocolType) {
    let wrapper = DelegateWrapper(delegate as AnyObject)
    delegateWrappers.append(wrapper)
  }
  
  func removeDelegate(_ delegate: ProtocolType) {
    guard let index = delegateWrappers.firstIndex(where: { $0.delegate === (delegate as AnyObject) }) else {
      debugPrint("Error. An attempt to remove the object \(delegate) from a MulticastDelegate has detected that this object isn't contained by any delegate wrapper. Maybe you try to remove an object that has not been added as a delegate?")
      
      return
    }
    delegateWrappers.remove(at: index)
  }
  
  func invokeDelegates(_ closure: (ProtocolType) -> ()) {
    delegates.forEach { closure($0) }
  }
}
