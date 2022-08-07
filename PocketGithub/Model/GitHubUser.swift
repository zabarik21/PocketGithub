//
//  GitHubUser.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation


struct GitHubUser: Decodable {
  var name: String
  var bio: String?
  var avatarUrl: String
}
