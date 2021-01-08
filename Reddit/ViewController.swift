//
//  ViewController.swift
//  Reddit
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let service = NetworkService()

        service.execute(endpoint: .home) { result in
            switch result {
            case .success(let post):
                print(post)
            case .failure:
                print("error!!!!")
            }
        }

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

