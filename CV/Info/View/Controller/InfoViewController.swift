//
//  InfoViewController.swift
//  CV
//
//  Created by Ivan Erwin Lopez Ansaldo on 7/29/19.
//  Copyright © 2019 Ivan Erwin Lopez Ansaldo. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, InfoViewProtocol {
    
    var presenter: InfoPresenterProtocol?

    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var age: UILabel?
    @IBOutlet weak var country: UILabel?
    @IBOutlet weak var city: UILabel?
    @IBOutlet weak var email: UILabel?
    @IBOutlet weak var phoneNumber: UILabel?
    @IBOutlet weak var summary: UILabel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        presenter?.prepareSubViews()
    }
    
    func showInfo() {
        name?.text = presenter?.getFullName()
        age?.text = presenter?.getAge()
        country?.text = presenter?.getCountry()
        city?.text = presenter?.getCity()
        email?.text = presenter?.getMail()
        phoneNumber?.text = presenter?.getPhoneNumber()
        summary?.text = presenter?.getSummary()
    }
}
