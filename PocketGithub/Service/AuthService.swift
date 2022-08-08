//
//  AuthService.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation
import OAuthSwift
import Alamofire

struct AuthenticationTokenResponce: Decodable {
  var access_token: String
  var token_type: String
}

class AuthService {
  
  private enum AuthConstants {
    static let cliendId = "1a9af791d200ed9ae525"
    static let cliendSecret = "fb66ec5f993635aa301146e21efb129da8e432f7"
    static let authCallbackURI = "pocket-github://oauth-callback"
  }
  
  public enum NotificatoinNames: String {
    case loginObserverKey = "loginObserver"
  }
  
  
  static let shared = AuthService()
  
  private var token: String?
  
  public var oauth: OAuth2Swift!
  private let notificationCenter = NotificationCenter.default
  
  private init() {
    token = StorageService.shared.getToken()
  }
  
  func login(completion: @escaping (Result<Void, Error>) -> Void) {
    oauth = OAuth2Swift(
      consumerKey: AuthConstants.cliendId,
      consumerSecret: AuthConstants.cliendSecret,
      authorizeUrl: "https://github.com/login/oauth/authorize",
      responseType: "token"
    )
    
    oauth.allowMissingStateCheck = true
    
    oauth.authorize(
      withCallbackURL: AuthConstants.authCallbackURI,
      scope: "repo",
      state: "") { result in
        switch result {
        case .success:
          break
        case .failure(let error):
          completion(.failure(error))
          return
        }
      }
    completion(.success(()))
  }
  
  func handleCodeUrl(url: URL) {
    guard let code = getCode(from: url) else { return }
    
    var items = [String: String]()
    items["client_id"] = AuthConstants.cliendId
    items["client_secret"] = AuthConstants.cliendSecret
    items["code"] = code
    items["redirect_uri"] = AuthConstants.authCallbackURI
    
    AF.request(
      "https://github.com/login/oauth/access_token",
      method: .post,
      parameters: items,
      headers: [HTTPHeader(
        name: "Accept",
        value: "application/json"
      )]
    )
      .responseDecodable(of: AuthenticationTokenResponce.self) { result in
        if let error = result.error {
          print(error)
        } else {
          guard let accessToken = result.value?.access_token else { return }
          self.token = accessToken
          StorageService.shared.saveToken(token: accessToken)
          self.pushNotification()
        }
      }
  }
   
  
  func pushNotification() {
    notificationCenter.post(
      name: NSNotification.Name(NotificatoinNames.loginObserverKey.rawValue),
      object: nil
    )
  }
  
  func getCode(from url: URL) -> String? {
    guard let items = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems else { return nil }
    for item in items {
      if item.name == "code" {
        return item.value
      }
    }
    return nil
  }
  
}
