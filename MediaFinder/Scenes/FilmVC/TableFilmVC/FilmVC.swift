//
//  FilmVC.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 2/14/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import SQLite
import AVFoundation

var returnUserSqlData: AnySequence<Row>!
var database1: Connection!

class FilmVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mediaSearchText: UISearchBar!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    var player = AVPlayer()
    var presenter: filmPresenter!
    var iTunesArr = [MediaData]()
    var str: String?
    var seg: String!
   
    
    var lastStr: String?
    var lastSeg: String!
    var searchCheck : Bool = false
    var segmentedCheck : Bool = false
    var showningImage: Bool = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        mediaSearchText.delegate = self
        presenter = filmPresenter(view: self)
        presenter.viewDidLoad()
        checkData()
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        lastStr = str
//        lastSeg = seg
//        print(lastStr)
//        print(lastSeg)
//    }
    
    func checkData(){
        let savedData = UserDefaults.standard.object(forKey: sqlKeys.showngMedia) as? Data
        if savedData != nil {
            let savedMedia = presenter.readCheckData()
            print(savedMedia)
            if savedMedia.isShowingMedia == true {
                presenter.readSqlData()
                tableView.reloadData()
            }
        }

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        if searchBar.text == ""
         { str = "All" }
        else { str = searchBar.text ?? "" }
        
        searchCheck = true
        confirmBindData()

    }
    
    func confirmBindData(){
        if searchCheck == true && segmentedCheck == false {
            seg = mediaInfo.music.rawValue
            showningImage = false
        }
        else if searchCheck == false && segmentedCheck == false {
            str = "song"
            seg = mediaInfo.music.rawValue
            showningImage = false
        }
        else {
            if mediaSearchText.text == "" {
                str = "All"
           }
           else {
                str = mediaSearchText.text
           }
        }
        filmSqlData.shared().isShowngMedia = true
        activityView.layer.cornerRadius = 8
        activityView.layer.masksToBounds = true
        activityView.isHidden = false
        
        bindData()

    }
    
    func updateUI(){
        activityView.isHidden = true
        tableView.backgroundView = UIImageView(image: UIImage(named: "musicBG"))
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func mediaChoice(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            seg = mediaInfo.movie.rawValue
            segmentedCheck = true
                        
        case 1:
            seg = mediaInfo.tvShow.rawValue
            segmentedCheck = true

        case 2:
            seg = mediaInfo.music.rawValue
            segmentedCheck = true
            
        default:
            
            break
        }
        
    }
    @IBAction func searchIconButton(_ sender: Any) {
        
        confirmBindData()
    }
    
    
    @IBAction func deleteHistory(_ sender: Any) {
        presenter.deleteDataBase()
        iTunesArr = []
        tableView.reloadData()
    }
}

