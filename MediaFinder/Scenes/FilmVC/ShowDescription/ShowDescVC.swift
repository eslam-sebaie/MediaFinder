//
//  ShowDescVC.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 2/29/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import AVFoundation
import Kingfisher

class ShowDescVC: UIViewController {

  
    @IBOutlet weak var descImage: UIImageView!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var viewImage: UIView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var timeElapsedLabel: UILabel!
    
    @IBOutlet weak var timeRemainigLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var favouriteButton: UIButton!
    
    
    var player: AVPlayer?
    var timer: Timer?
    var preview: String = ""
    var name:String = ""
    var receiveImage: String!
    var receiveDesc: String!
    var receiveCheckImage: Bool!
    var favourited:Bool = false
    var seconds:Float64!
    
    var newItunesArr = [MediaData]()
    var receiveIndex:Int!
    var newIndex:Int!
    
    var gameTimer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
 
        repeatBouncing()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      bouncing()
    }
    
    func updateUI(){
        
        let url = URL(string: receiveImage)
        descImage.kf.setImage(with: url)
        
        labelDescription.text = receiveDesc
        artistLabel.text = name
    }
    

    @IBAction func favouriteTapped(_ sender: Any) {
        favourited = !favourited
        if favourited == true {
            favouriteButton.setImage(UIImage(named: "icons8-red-heart-96.png"), for: .normal)
        } else {
            favouriteButton.setImage(UIImage(named: "white.png"), for: .normal)
        }
    }
    
    @IBAction func playPausedButton(_ sender: Any) {
         if player?.rate == 0 {
             player!.play()
             playPauseButton.setImage(UIImage(named: "icons8-pause-96.png"), for: .normal)
         } else {
             player!.pause()
             playPauseButton.setImage(UIImage(named: "icons8-play-96.png"), for: .normal)
         }
    }
    
    @IBAction func closeMedia(_ sender: Any) {
        if player?.rate == 1 {
            player!.pause()
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if player?.rate == 1 {
           player!.pause()
        }
        receiveIndex += 1
        let newPreview = newItunesArr[receiveIndex].previewUrl
        nextPreviousPlay()
        showMedia(prev: newPreview)
    }
    
    @IBAction func previousButton(_ sender: Any) {
        
        receiveIndex -= 1
        if player?.rate == 1 {
            player!.pause()
        }
        if receiveIndex <= 0 {
            receiveIndex = 0
            showMedia(prev: preview)
            updateUI()
           
        }
        else {
              let newPreview = newItunesArr[receiveIndex ].previewUrl
              nextPreviousPlay()
              showMedia(prev: newPreview)
              
        }
      
}
    func nextPreviousPlay(){
           
            let typeOfMedia = newItunesArr[receiveIndex].getType()
             if typeOfMedia == mediaInfo.tvShow {
                artistLabel.text = newItunesArr[receiveIndex].artistName ?? ""
                labelDescription.text = receiveDesc ?? "tvShow"
                receiveCheckImage = true

              }
              else if typeOfMedia == mediaInfo.movie  {
               artistLabel.text = newItunesArr[receiveIndex].trackName ?? ""
                labelDescription.text = receiveDesc ?? "Movie"
                receiveCheckImage = true
              }
               else if typeOfMedia == mediaInfo.music {
                artistLabel.text = newItunesArr[receiveIndex].trackName ?? ""
                labelDescription.text = receiveDesc ?? "Music"
                receiveCheckImage = false
               }
               receiveImage = newItunesArr[receiveIndex].artworkUrl100
               let url = URL(string: receiveImage)
               descImage.kf.setImage(with: url)
       }
    
}
























//            receiveImage = newItunesArr[receiveIndex].artworkUrl100
//            let url = URL(string: receiveImage)
//            descImage.kf.setImage(with: url)
//
//            labelDescription.text = receiveDesc
//            artistLabel.text = name
