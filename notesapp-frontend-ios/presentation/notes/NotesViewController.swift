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
    private lazy var tableView = UITableView(decorator: viewModel,
                                             frame: view.bounds)
    private let createButton = UIBarButtonItem(barButtonSystemItem: .add,
                                               target: nil,
                                               action: nil)

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
        navigationItem.rightBarButtonItem = createButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        configureView()
    }
}

extension NotesViewController: ViewModelBindable {
    private var input: NotesViewModel.Input {
        let viewWillAppear = rx.sentMessage(#selector(viewDidAppear(_:)))
            .map { _ in }
            .asDriver(onErrorJustReturn: ())
        let createButtonTap = createButton.rx
            .tap
            .asDriver()
        let cellSelection = tableView.rx
            .itemSelected
            .asDriver()

        return NotesViewModel.Input(viewWillAppear: viewWillAppear,
                                    createButtonTap: createButtonTap,
                                    cellSelection: cellSelection)
    }

    func bind(to viewModel: NotesViewModel) {
        let output = viewModel.transform(input: input)

        output.notesUio
            .drive(tableView.rx.items(
                cellIdentifier: NoteTableViewCell.id,
                cellType: NoteTableViewCell.self)) { (_, noteUio, cell) in
                    cell.textLabel?.text = noteUio.title
                }
            .disposed(by: disposeBag)
        output.transitionToCreateNote
            .drive()
            .disposed(by: disposeBag)
        output.transitionToUpdateNote
            .drive()
            .disposed(by: disposeBag)
    }
}
