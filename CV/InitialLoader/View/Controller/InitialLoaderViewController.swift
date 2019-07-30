//
//  InitialLoaderViewController.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/19/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class InitialLoaderViewController: UIViewController {
    
    var presenter: InitialLoaderPresenterProtocol?
    var status: StatusType = .initial {
        didSet {
            descriptionLabel.text = status.description
        }
    }
    
    let activityIndicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
    
    let descriptionLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: StatusType.initial.description, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        textView.attributedText = attributedText
        return textView
    }()
    
    let tryAgain: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(AppConstants.tryAgain, for: .normal)
        button.backgroundColor = AppConstants.Color.secondary
        button.setTitleColor(AppConstants.Color.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(didTapTryAgain), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    @objc private func didTapTryAgain() {
        update(status: .initial, cv: nil, error: nil)
        presenter?.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppConstants.Color.white
        view.addSubview(activityIndicator)
        view.addSubview(descriptionLabel)
        view.addSubview(tryAgain)
        setupLayout()
        
        presenter?.viewDidLoad()
    }
    
    private func setupLayout() {
        // Activity Indicator Constraints
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Description Label Constraints
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: activityIndicator.topAnchor, constant: -15.0).isActive = true
        
        // TryAgain Button Constraints
        tryAgain.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 15.0).isActive = true
        tryAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tryAgain.widthAnchor.constraint(equalToConstant: 300).isActive = true
        tryAgain.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension InitialLoaderViewController: InitialLoaderViewProtocol {
    func update(status: StatusType, cv: Curriculum?, error: String?) {
        self.status = status
        switch status {
        case .initial:
            tryAgain.isHidden = true
            activityIndicator.startAnimating()
        case.failureFinish:
            tryAgain.isHidden = false
            descriptionLabel.text = error
            activityIndicator.stopAnimating()
        case .successfullyFinish:
            guard let cv = cv else {return}
            presenter?.showCurriculum(with: cv, from: self)
        }
    }
}
