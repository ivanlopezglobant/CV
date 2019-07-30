//
//  CurriculumViewController.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class CurriculumViewController: UIViewController, CurriculumViewProtocol {
    
    var presenter: CurriculumPresenterProtocol?
    
    @IBOutlet weak var contactInformationContainer: UIView?
    @IBOutlet weak var tableView: UITableView!
    
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppConstants.Color.secondary
        return view
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "IvanLopez"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.accessibilityIdentifier = AccessibilityIdentifier.profileImage.rawValue
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let profileName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.accessibilityIdentifier = AccessibilityIdentifier.profileNameLabel.rawValue
        return label
    }()
    
    let profileContact: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = AccessibilityIdentifier.profileContact.rawValue
        return label
    }()
    
    let childContainter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureNavBar()
        
        contactInformationContainer?.addSubview(profileImage)
        contactInformationContainer?.addSubview(childContainter)
        childContainter.addSubview(profileName)
        childContainter.addSubview(profileContact)
        childContainter.addSubview(separator)
        
        setupContactInformationContainerontactInformationContainer()
    }
    
    private func configureNavBar() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .blackTranslucent
        let info = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(infoTapped))
        self.navigationItem.rightBarButtonItem  = info
        title = AppConstants.curriculum
    }
    
    @objc private func infoTapped() {
        guard let person = presenter?.getPerson() else {return}
        presenter?.navigateToInfoView(from: self, with: person)
    }
    
    private func setupContactInformationContainerontactInformationContainer() {
        guard let container = contactInformationContainer else {return}
        
        profileImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 5).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.6).isActive = true
        
        childContainter.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        childContainter.topAnchor.constraint(equalTo: profileImage.bottomAnchor).isActive = true
        childContainter.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        profileName.bottomAnchor.constraint(equalTo: childContainter.centerYAnchor, constant: -10.0).isActive = true
        profileName.centerXAnchor.constraint(equalTo: childContainter.centerXAnchor).isActive = true
        
        profileContact.topAnchor.constraint(equalTo: childContainter.centerYAnchor).isActive = true
        profileContact.centerXAnchor.constraint(equalTo: childContainter.centerXAnchor).isActive = true
        
        separator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        separator.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -1).isActive = true
    }
    
    func showCV(with cv: Curriculum) {
        profileName.text = "\(cv.person.firstName) \(cv.person.lastName)"
        profileContact.text = "\(cv.person.phoneNumber)\n\(cv.person.mail)"
        tableView.reloadData()
    }
}

extension CurriculumViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.getNumberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getTitleSection(at: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else {fatalError()}
        let sectionType = presenter.getSectionType(at: indexPath.section)
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionType.cell, for: indexPath)
        
        configureCell(cell: cell, sectionType: sectionType, indexPath: indexPath)
        
        return cell
    }
    
    private func configureCell(cell: UITableViewCell, sectionType: CVSections, indexPath: IndexPath) {
        
        let data = presenter?.getDataCell(at: indexPath)
        
        switch sectionType {
        case .education:
            if let education = data as? Education {
                cell.textLabel?.text = education.name
                cell.detailTextLabel?.text = education.degree
            }
        case .experience:
            if let experience = data as? ProfesionalExperience {
                cell.textLabel?.text = "\(experience.name) (\(experience.startDate) - \(experience.endDate ?? AppConstants.current))"
                cell.detailTextLabel?.text = experience.role
            }
        case .skill:
            if let skill = data as? Skills {
                cell.textLabel?.text = skill.name
            }
        case .language:
            if let language = data as? Language {
                cell.textLabel?.text = language.name
                cell.detailTextLabel?.text = language.level
            }
        case .programmingLanguage:
            if let language = data as? ProgrammingLanguage {
                cell.textLabel?.text = language.name
                cell.detailTextLabel?.text = language.duration
            }
        }
    }
}

