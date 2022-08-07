//
//  Validator.swift
//  Github Mobile
//
//  Created by Timofey on 7/8/22.
//

import Foundation

enum ValidatorFieldsError {
  case email
  case password
}


enum Validator {
  
  static func isFilled(
    email: String?,
    password: String?
  ) -> [ValidatorFieldsError] {
    var errors = [ValidatorFieldsError]()
    if let password = password {
      if password.count < 8 {
        errors.append(.password)
      }
    } else {
      errors.append(.password)
    }
      
    if email == nil || email == "" {
      errors.append(.email)
    }
    return errors
  }
  
  
}
