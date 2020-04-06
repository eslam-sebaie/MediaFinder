//
//  TableCell+CellviewProtocol.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
extension FilmTableViewCell {
    func updateUI(){
        backgroundColor = UIColor.clear
        viewCell.layer.cornerRadius = 20
        viewCell.layer.masksToBounds = true
        viewCell.alpha = 1
        filmImage.layer.cornerRadius = 10
        filmImage.layer.masksToBounds = true
        
    }
}
