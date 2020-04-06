//
//  FilmVC+PrepareData.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/17/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension FilmVC {
     func bindData(){
        
        let savedFilms = filmSqlData.readData()
        APIManager.loadItunes(mediaType: str!, criteria:seg) { (error, itunes) in
            if let error = error {
                    print(error.localizedDescription)
                } else if let data = itunes {
                    self.iTunesArr = data
                      if self.iTunesArr.count > 0 {
                        self.activityView.isHidden = true
                      }
                      else if self.iTunesArr.count == 0 {
                        self.activityView.isHidden = true
                        self.show_Alert("Wrong Term")
                      }
                    self.tableView.reloadData()
                
                    if savedFilms.isShowingMedia == true {
//                        self.presenter.deleteDataBase()
                        self.presenter.insertData(media: self.iTunesArr)
                    }
                    
             }
                   
         }
    }
}
