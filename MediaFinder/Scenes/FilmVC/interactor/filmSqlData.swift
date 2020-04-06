//
//  filmSqlData.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/9/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
import SQLite
class filmSqlData {
    
    private static let sharedInstance = filmSqlData()
    
    static func shared() -> filmSqlData {
        
        return filmSqlData.sharedInstance
    }
    
    let intialFilmsTables = Table("intialFilms")
    var artworkUrl100 = Expression<String>("image")
    var artistName = Expression<String>("artistName")
    var trackName = Expression<String>("trackName")
    var longDescription = Expression<String>("Description")
    var previewUrl = Expression<String>("previewUrl")
    var kind = Expression<String>("kind")

    
    var isShowngMedia: Bool  {
           
           set {
               
               UserDefaults.standard.set(newValue, forKey: sqlKeys.showngMedia)
               filmSqlData.setData(val: newValue)
           }
           get {
               
               return UserDefaults.standard.bool(forKey: userDefaultKeys.isLogged)
           }
           
    }
    
    static func setData(val: Bool) {
    
            let films = FilmCheck(isShowingMedia: val)
            let encoder = JSONEncoder()
            guard let encoded = try? encoder.encode(films) else {return}
            UserDefaults.standard.set(encoded, forKey: sqlKeys.showngMedia)
    
        }
    
      static func readData() -> FilmCheck {
    
        let decoder = JSONDecoder()
        let savedUser = (UserDefaults.standard.object(forKey: sqlKeys.showngMedia) as? Data)!
        let storedData = try? decoder.decode(FilmCheck.self, from: (savedUser))
            return storedData!
        }

    

    func getDirectory (){
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = documentDirectory.appendingPathComponent("intialPresentFilms").appendingPathExtension("filmSqlite1")
        print(fileUrl)
        let mydatabase = try! Connection(fileUrl.path)
        database1 = mydatabase
    }
    
    func createTable(){
        
        let createTable = self.intialFilmsTables.create { (table) in
            table.column(self.artworkUrl100)
            table.column(self.artistName)
            table.column(self.trackName)
            table.column(self.longDescription)
            table.column(self.previewUrl)
            table.column(self.kind)
        }
        do {
            
            try database1.run(createTable)
            print("tableCreated")
            
        }catch{
            print(error)
        }
    }
    
    func insertFilm(mediaArray:[MediaData]){
        var insertFilms: Insert!
        for film in mediaArray {
            
            insertFilms = intialFilmsTables.insert(filmSqlData.shared().artworkUrl100 <- film.artworkUrl100 ,filmSqlData.shared().artistName <- film.artistName ?? "", filmSqlData.shared().trackName <- film.trackName ?? "", filmSqlData.shared().longDescription <- film.longDescription ?? "", filmSqlData.shared().previewUrl <- film.previewUrl, filmSqlData.shared().kind <- film.kind ?? "song")
            
            do {
                try database1.run(insertFilms)
                print("inserted")
            }catch {
                print("error")
            }
        }
        
    }
    
    
 
    
//    
//    func getData() -> AnySequence<Row>{
//        let returnUsers = try! database.prepare(filmSqlData.shared().intialFilmsTables)
//        return returnUsers
//    }
    
    
    
}
