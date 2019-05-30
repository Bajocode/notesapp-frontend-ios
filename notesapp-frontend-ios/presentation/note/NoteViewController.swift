//
//  NoteViewController.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 29/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift
import RxCocoa

class NoteViewController: UIViewController {
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var bodyTextView: UITextView!
    @IBOutlet private weak var trashBarButtonItem: UIBarButtonItem! {
        didSet {
            self.trashBarButtonItem.rx
                .tap
                .asDriver()
                .do(onNext: { [weak self] in
                    self?.dismiss(animated: true, completion: nil)
                })
                .drive()
                .disposed(by: disposeBag)
        }
    }
    @IBOutlet private weak var toolbar: UIToolbar!

    private let disposeBag = DisposeBag()
    private let viewModel: NoteViewModel

    init(viewModel: NoteViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        configureView()
    }

    private func configureView() {}
}

extension NoteViewController: ViewModelBindable {
    private var input: NoteViewModel.Input {
        return NoteViewModel.Input(doneButtonTap: Driver.empty(),
                                   deleteButtonTap: Driver.empty(),
                                   titleTextFieldText: Driver.empty(),
                                   bodyTextFieldText: Driver.empty())
    }

    func bind(to viewModel: NoteViewModel) {}
}
