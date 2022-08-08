//
//  SceneDelegate.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import UIKit
import OAuthSwift
import Alamofire

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  @available(iOS 13.0, *)
  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    guard let url = URLContexts.first?.url else { return }
    print(url)
    if url.host == "oauth-callback" {
      AuthService.shared.handleCodeUrl(url: url)
    }
  }
  
  @available(iOS 13.0, *)
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let viewController: UIViewController?
    if let _ = StorageService.shared.getToken() {
      let layout = CollectionViewLayoutFactory.shared.getReposListLayout(windowBounds: window.bounds)
      let reposView = RepoListViewController(collectionViewLayout: layout)
      viewController = MainNavigationController(rootViewController: reposView)
    } else {
      viewController = LoginViewController()
    }
    self.window = window
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }

  @available(iOS 13.0, *)
  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  @available(iOS 13.0, *)
  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }
  
  @available(iOS 13.0, *)
  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  @available(iOS 13.0, *)
  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  @available(iOS 13.0, *)
  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

