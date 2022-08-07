//
//  CommitApiResponce.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation


struct CommitApiResponce: Decodable {
  var sha: String
  var commit: Commit
}
