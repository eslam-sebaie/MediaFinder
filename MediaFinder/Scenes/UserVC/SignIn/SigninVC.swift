//
//  SignupVC.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 2/5/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import SQLite
class SigninVC: UIViewController {
    

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var signInButtonChange: UIButton!
    
    var presenter: SignUpPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SignUpPresenter(view: self)
        presenter.getDirec()
        updateUI()
      
    }
    
    
    func updateUI() {
        signInButtonChange.layer.cornerRadius = 23
        signInButtonChange.layer.masksToBounds = true
    }
    
    func fetchDataSuccess() {
        presenter.readSqlData()
    }


    @IBAction func signinButtonPressed(_ sender: Any) {
        presenter.readSqlData()
//        signPress()
    }
    
    @IBAction func newAccountButton(_ sender: Any) {
        UserDefaultsManager.shared().isLogged = false
        instantiateSignUpVC()
    }
}





//extension SigninVC: SignUpView {
//    func fetchDataSuccess(retData: AnySequence<Row>) {
//        print("e")
//    }
//
//
//}
