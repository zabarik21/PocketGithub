//
//  Repo.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation


struct Repo: Decodable {
  let name: String
  let owner: RepoOwner
  let forks: Int
  let watchers: Int
  let description: String?
}
