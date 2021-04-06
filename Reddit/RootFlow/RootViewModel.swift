//
//  RootViewModel.swift
//  Reddit
//
//  Created by Nick Long on 4/6/21.
//

import Foundation

protocol RootViewModelProtocol {

    var models: [RootModel] { get }

    func load(_ handler: @escaping (Error?) -> Void)
}

public final class RootViewModel: RootViewModelProtocol {

    let networkService: NetworkService
    var models: [RootModel] = .init()

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func load(_ handler: @escaping (Error?) -> Void) {
        networkService.execute(endpoint: .home) { [weak self] result in
            switch result {
            case .success(let page):
                self?.models = page.posts.map {
                    RootModel(title: $0.title,
                              subreddit: $0.subreddit,
                              url: $0.url)
                }
                handler(nil)
            case .failure(let error):
                self?.models = []
                handler(error)
            }
        }
    }
}
