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
    @IBOutlet private weak var trashBarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var toolbar: UIToolbar!

    private let doneButton = UIBarButtonItem(
        barButtonSystemItem: .done, target: nil, action: nil)
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

    private func configureView() {
        navigationItem.setRightBarButtonItems([doneButton], animated: true)
    }
}

extension NoteViewController: ViewModelBindable {
    private var input: NoteViewModel.Input {
        return NoteViewModel.Input(doneButtonTap: doneButton.rx.tap.asDriver(),
                                   deleteButtonTap: trashBarButtonItem.rx.tap.asDriver(),
                                   titleTextFieldText: titleTextField.rx.text.orEmpty.asDriver(),
                                   bodyTextFieldText: bodyTextView.rx.text.orEmpty.asDriver())
    }

    func bind(to viewModel: NoteViewModel) {
        let output = viewModel.transform(input: input)
        let dismiss = { [weak self] in
            if let presenter = self?.presentingViewController {
                presenter.dismiss(animated: true, completion: nil)
            } else {
                self?.navigationController?.popViewController(animated: true)
            }
        }

        output.initialNoteUio
            .drive(onNext: { [weak self] in
                self?.titleTextField.text = $0.title
                self?.bodyTextView.text = $0.body
            })
            .disposed(by: disposeBag)
        output.noteCreation
            .do(onNext: { dismiss() })
            .drive()
            .disposed(by: disposeBag)
        output.noteDeletion
            .drive()
            .disposed(by: disposeBag)
        trashBarButtonItem.rx
            .tap
            .asDriver()
            .do(onNext: { dismiss() })
            .drive()
            .disposed(by: disposeBag)
    }
}
