//
//  ViewController.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 2/4/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import SQLite
var database: Connection!

class SignUpVC: UIViewController, SignUpView {
    func fetchDataSuccess(userObject: Users) {
        print("e")
    }
    
    
    
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var switchGender: UISwitch!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var checkEmailLabel: UILabel!
    @IBOutlet weak var checkPassLabel: UILabel!

    var presenter: SignUpPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SignUpPresenter(view: self)
        presenter.getDirec()
        updateUI()
    }
    
    
    func updateUI(){
        emailTextfield.layer.borderWidth = 1
        passwordTextfield.layer.borderWidth = 1
        checkPassLabel.isHidden = true
        checkEmailLabel.isHidden = true
    }
    
    
    @IBAction func signPressed(_ sender: Any) {
        signPress()
    }
    
    
    @IBAction func switchPressed(_ sender: Any) {
        switchIsChanged(switchGender: switchGender)
    }

    @IBAction func sendToMap(_ sender: Any) {
        instantiateMapVC()
    }
}




