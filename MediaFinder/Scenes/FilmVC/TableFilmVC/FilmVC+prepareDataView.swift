//
//  FilmVC+prepareDataView.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 4/3/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension FilmVC: filmVCView {
    func prepareData(FilmObj: [MediaData]) {
        print("eslam sebaie")
        self.iTunesArr = FilmObj
    }
}
