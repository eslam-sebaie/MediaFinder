//
//  filmVC+TableView.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
extension FilmVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iTunesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!FilmTableViewCell
        cell.configureCell(media: iTunesArr[indexPath.row])
//        activityIndicator.isHidden = true
//        loadingLabel.isHidden = true
//        activityView.isHidden = true
        return cell
        
    }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let showDescVC = sb.instantiateViewController(withIdentifier: "ShowDescVC") as! ShowDescVC
            let typeOfMedia = iTunesArr[indexPath.row].getType()
            showDescVC.newItunesArr = iTunesArr
            showDescVC.receiveIndex = indexPath.row
           
            
        if typeOfMedia == mediaInfo.tvShow {
            showDescVC.name = iTunesArr[indexPath.row].artistName ?? ""
             showDescVC.receiveDesc = str ?? "tvShow"
            showningImage = true

           }
           else if typeOfMedia == mediaInfo.movie  {
            showDescVC.name = iTunesArr[indexPath.row].trackName ?? ""
             showDescVC.receiveDesc = str ?? "Movie"
            showningImage = true
           }
            else if typeOfMedia == mediaInfo.music {
             showDescVC.name = iTunesArr[indexPath.row].trackName ?? ""
             showDescVC.receiveDesc = str ?? "Music"
            showningImage = false
            }
            showDescVC.receiveImage = iTunesArr[indexPath.row].artworkUrl100
            showDescVC.preview = iTunesArr[indexPath.row].previewUrl
//            showDescVC.receiveDesc = str ?? "All"
            showDescVC.receiveCheckImage = showningImage
            showDescVC.showMedia(prev: iTunesArr[indexPath.row].previewUrl)
            
            self.present(showDescVC ,animated: true, completion: nil)
            
        }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
               let rotateTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
               cell.layer.transform = rotateTransform
               UIView.animate(withDuration: 1.0) {
                   
                   cell.layer.transform = CATransform3DIdentity
               }
               
        }
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let IMDB = UIContextualAction(style: .normal, title: "IMDB") { (action, view, nil) in
//            UIApplication.shared.open(URL(string: filmSqlData.shared().myFilms.imdbLinks[indexPath.row])!)
//        }
//        IMDB.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
//        let configure = UISwipeActionsConfiguration(actions: [IMDB])
//        configure.performsFirstActionWithFullSwipe = false
//        return configure
//    }
//
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let Trailer = UIContextualAction(style: .normal, title: "Trailer") { (action, view, nil) in
//            UIApplication.shared.open(URL(string: filmSqlData.shared().myFilms.trailerLinks[indexPath.row])!)
//        }
//        Trailer.backgroundColor = #colorLiteral(red: 0.4893874268, green: 0.557599128, blue: 0.781805203, alpha: 1)
//        let configure = UISwipeActionsConfiguration(actions: [Trailer])
//        configure.performsFirstActionWithFullSwipe = false
//        return configure
//    }

}
