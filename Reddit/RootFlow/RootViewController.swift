//
//  RootViewController.swift
//  Reddit
//

import UIKit

public final class RootViewController: UITableViewController {

    private let viewModel: RootViewModelProtocol

    private var didSelect: ((RootModel) -> Void)?

    init(viewModel: RootViewModelProtocol) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.load() { [weak self] error in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.models.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        let dequedCell = tableView.dequeueReusableCell(withIdentifier: "RootCell")
        if dequedCell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "RootCell")
        } else {
            cell = dequedCell!
        }

        let model = viewModel.models[indexPath.row]

        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.subreddit

        return cell
    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.models[indexPath.row]
        didSelect?(model)
    }

    func onSelect(_ handler: @escaping (RootModel) -> Void) -> Self {
        self.didSelect = handler
        return self
    }
}
