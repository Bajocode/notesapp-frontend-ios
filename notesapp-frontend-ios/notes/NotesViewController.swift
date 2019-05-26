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
    private let viewModel: NoteViewModel
    private lazy var tableView = UITableView()

    init(viewModel: NoteViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()


    }

}
