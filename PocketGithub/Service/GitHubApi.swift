//
//  GitHubApi.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import Alamofire



class GitHubApi {
  
  static let shared = GitHubApi()
  
  let baseUrl = "https://api.github.com"
  
  let headers: HTTPHeaders = [
    .authorization(bearerToken: "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")
  ]
  
  func fetchRepos(completion: @escaping (Result<[Repo], Error>) -> Void) {
    let url = "https://api.github.com/user/repos"
    
    AF.request(url, method: .get, headers: headers)
      .responseDecodable(of: [Repo].self) { responce in
        switch responce.result {
        case .success(let repos):
          completion(.success(repos))
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }
  
  func fetchCommits(for repo: Repo, completion: @escaping (Result<[CommitApiResponce], Error>) -> Void) {
    let repoName = repo.name
    let url = "https://api.github.com/repos/zabarik21/\(repoName)/commits"
    print(url)
    AF.request(url, method: .get, headers: headers)
      .responseDecodable(of: [CommitApiResponce].self) { responce in
        switch responce.result {
        case .success(let commits):
          completion(.success(commits))
        case .failure(let error):
          print(error)
          completion(.failure(error))
        }
      }
  }
}
