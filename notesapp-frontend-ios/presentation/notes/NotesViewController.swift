//
//  NotesViewController.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift
import RxCocoa

class NotesViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: NotesViewModel
    private lazy var tableView = UITableView(decorator: viewModel, frame: view.bounds)

    init(viewModel: NotesViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        view.addSubview(tableView)
        tableView.constrainAllEdgesToSuperView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}
