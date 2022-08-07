//
//  UIView + Twitch.swift
//  Github Mobile
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit


extension UIView {
  
  func twitch() {
    let twitchAnim = CAKeyframeAnimation(keyPath: "position.x")
    
    twitchAnim.values = [0, 10, -10, 10, 0]
    twitchAnim.isAdditive = true
    twitchAnim.keyTimes = [0, 0.16, 0.5, 0.83, 1]
    twitchAnim.duration = 0.25
    
    self.layer.add(twitchAnim, forKey: "twitch")
  }
  
}
