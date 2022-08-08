//
//  StorageService.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation

class StorageService {
  
  public enum UserDefaultsKeys {
    static let loginObserverKey = "loginObserver"
    static let tokenKey = "token"
  }
  
  static let shared = StorageService()
  private let standart = UserDefaults.standard
  
  private let lock = NSLock()
  
  private init() {}
  
  func saveToken(token: String) {
    lock.lock()
    standart.set(token, forKey: UserDefaultsKeys.tokenKey)
    lock.unlock()
  }
  
  func getToken() -> String? {
    return standart.string(forKey: UserDefaultsKeys.tokenKey)
  }
  
}
