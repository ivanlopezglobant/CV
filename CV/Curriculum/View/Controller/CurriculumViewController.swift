//
//  CurriculumViewController.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/21/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class CurriculumViewController: UITableViewController, CurriculumViewProtocol {
    
    var presenter: CurriculumPresenterProtocol?
    
    let containerHeader: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 280))
        view.backgroundColor = AppConstants.Color.defaultBackground
        return view
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureNavBar()

        containerHeader.addSubview(profileImage)
        containerHeader.addSubview(profileName)
        containerHeader.addSubview(profileContact)
        containerHeader.addSubview(separator)
        setupContactInformationContainerontactInformationContainer()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = containerHeader
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
        
        profileImage.topAnchor.constraint(equalTo: containerHeader.topAnchor, constant: 5).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: containerHeader.centerXAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: containerHeader.heightAnchor, multiplier: 0.6).isActive = true

        profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10.0).isActive = true
        profileName.centerXAnchor.constraint(equalTo: containerHeader.centerXAnchor).isActive = true

        profileContact.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 10.0).isActive = true
        profileContact.centerXAnchor.constraint(equalTo: containerHeader.centerXAnchor).isActive = true

        separator.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        separator.widthAnchor.constraint(equalTo: containerHeader.widthAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: containerHeader.bottomAnchor, constant: -1).isActive = true
    }
    
    func showCV(with cv: Curriculum) {
        profileName.text = "\(cv.person.firstName) \(cv.person.lastName)"
        profileContact.text = "\(cv.person.phoneNumber)\n\(cv.person.mail)"
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.getNumberOfSections() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getTitleSection(at: section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfRows(in: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else {fatalError()}
        let sectionType = presenter.getSectionType(at: indexPath.section)
        let cell: UITableViewCell
        
        switch sectionType {
        case .education, .experience:
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: sectionType.cell)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = .byWordWrapping
        case .language, .programmingLanguage:
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: sectionType.cell)
        case .skill:
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: sectionType.cell)
        }
        
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

