//
//  ProfileViewController.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 2/4/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import SQLite
class ProfileViewController: UIViewController {
   
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var passLable: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var logoutButtonChange: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
     var imagePicker = UIImagePickerController()
    var newId: Int = 0
    
     var presenter: SignUpPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignUpPresenter(view: self)
        presenter.getDirec()
        updateUI()
        presenter.readSqlData()
    }
    
    
    
    
    @IBAction func logoutButton(_ sender: Any) {
         UserDefaultsManager.shared().isLogged = false
         instantiateSignUpVC()
    }
    
    @IBAction func imageOnclick(_ sender: Any) {
       chooseImage()
    }
    
    @IBAction func savePhotoButton(_ sender: Any) {
        
        _ = imageSave.saveImage(image: profileImage.image ?? #imageLiteral(resourceName: "icons8-add-administrator-80"))
        
    }
}



