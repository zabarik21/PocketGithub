//
//  AppDelegate.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import UIKit
import OAuthSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    guard let souceApp = options[.sourceApplication] as? String else { return false }
    if souceApp == "com.apple.SafariViewService" || souceApp == "com.apple.mobilesafari" {
      if url.host == "oauth-callback" {
        AuthService.shared.handleCodeUrl(url: url)
      }
      return true
    }
    return false
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if #available(iOS 13.0, *) {
      
    } else {
      let viewController: UIViewController?
      let window = UIWindow(frame: UIScreen.main.bounds)
      if let _ = StorageService.shared.getToken() {
        let layout = CollectionViewLayoutFactory.shared.getReposListLayout(windowBounds: window.bounds)
        let repoViewController = RepoListViewController(collectionViewLayout: layout)
        viewController = MainNavigationController(rootViewController: repoViewController)
      } else {
        viewController = LoginViewController()
      }
      window.rootViewController = viewController
      self.window = window
      self.window?.makeKeyAndVisible()
    }
    return true
  }

  // MARK: UISceneSession Lifecycle

  @available(iOS 13.0, *)
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  @available(iOS 13.0, *)
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

