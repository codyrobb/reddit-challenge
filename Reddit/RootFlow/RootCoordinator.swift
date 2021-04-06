//
//  RootCoordinator.swift
//  Reddit
//
//  Created by Nick Long on 4/6/21.
//

import Foundation
import UIKit
import WebKit

final class RootCoordinator {

    private let networkService: NetworkService
    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController,
                networkService: NetworkService) {
        self.navigationController = navigationController
        self.networkService = networkService
    }

    func start() {
        let viewModel = RootViewModel(networkService: networkService)
        let viewController = RootViewController(viewModel: viewModel)
            .onSelect() { [weak self] model in
                let myRequest = URLRequest(url: model.url)
                let viewController = UIViewController()
                let webView = WKWebView()
                viewController.view = webView
                webView.load(myRequest)
                self?.navigationController.present(viewController, animated: true)
            }

        navigationController.pushViewController(viewController, animated: false)
    }
}
