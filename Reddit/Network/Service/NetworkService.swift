//
//  NetworkService.swift
//  Reddit
//
//  Created by Cody Robertson on 5/20/19.
//  Copyright © 2019 Cody Robertson. All rights reserved.
//

import Foundation


final class NetworkService {

    // MARK: -
    // MARK: Properties

    private var task: URLSessionDataTask?

    // MARK: -
    // MARK: Methods

    func execute(endpoint: Endpoint, completion: @escaping (Result<Page, NetworkError>) -> Void) {
        guard let url = URL(string: endpoint.path) else {
            completion(.failure(.invalidURL))
            return
        }

        task?.cancel()
        task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.unknownError(error)))
                return
            }

            do {
                let page = try JSONDecoder().decode(Page.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(.invalidResponse))
            }
        }

        task?.resume()
    }

}
