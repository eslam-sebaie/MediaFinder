//
//  filmVCPresenter.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import SQLite
import UIKit
protocol filmVCView: class {
    func prepareData(FilmObj: [MediaData])
}
protocol cellView {
    func setName(name:String)
    func setImage(image:String)
    func setDescription(description:String)
}

class filmPresenter {
     weak var delegate: filmVCView?
    var newfilmData: AnySequence<Row>!
    var filmObject = [MediaData]()
    
    init(view: filmVCView) {
        self.delegate = view
    }

    
    func viewDidLoad(){
        filmSqlData.shared().getDirectory()
        filmSqlData.shared().createTable()
    }
    
    func readCheckData() -> FilmCheck {
        return filmSqlData.readData()
    }
    
    func insertData(media:[MediaData]){
        filmSqlData.shared().insertFilm(mediaArray: media)
    }
    
    func readSqlData(){
        let newfilmData =  try! database1.prepare(filmSqlData.shared().intialFilmsTables)
           for films in newfilmData{
                      
           let newObjectData = MediaData(artworkUrl100: films[filmSqlData.shared().artworkUrl100], artistName: films[filmSqlData.shared().artistName], trackName: films[filmSqlData.shared().trackName], longDescription: films[filmSqlData.shared().longDescription], previewUrl: films[filmSqlData.shared().previewUrl], kind: films[filmSqlData.shared().kind])
           
               filmObject.append(newObjectData)
           }
         self.delegate?.prepareData(FilmObj: filmObject)

       }
    func deleteDataBase(){
        let newfilmData =  filmSqlData.shared().intialFilmsTables
        let deleteHistory = newfilmData.delete()
        do {
             try database1.run(deleteHistory)
        }catch {
           print(error)
        }
    }

    
    
    
    
}
