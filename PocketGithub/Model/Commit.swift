//
//  Commit.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation

struct Commit: Decodable {
  var message: String
  var committer: CommitAuthor
}
