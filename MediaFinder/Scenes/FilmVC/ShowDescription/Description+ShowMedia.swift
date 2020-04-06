//
//  Description+ShowMedia.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 4/3/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
extension ShowDescVC {
    
    func showMedia(prev: String){

           let heigh = view.frame.width * 0.85
           let videoPlayer = VideoPlayerView(frame: CGRect(x: 0, y: 35, width: view.frame.width , height: heigh))
           
           if receiveCheckImage == false {
               videoPlayer.isHidden = true
               
           }
           else {
               viewImage.isHidden = true
           }
           videoPlayer.backgroundColor = UIColor.black
           view.addSubview(videoPlayer)
           
        
           let url = URL(string: prev)
           print(prev)
           let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
           player = AVPlayer(playerItem: playerItem)
           
           let playerLayer=AVPlayerLayer(player: player!)

           videoPlayer.layer.addSublayer(playerLayer)
           playerLayer.frame = videoPlayer.frame
           player?.play()
           let duration : CMTime = playerItem.asset.duration
           let Myseconds : Float64 = CMTimeGetSeconds(duration)
           print("eslam   \(Myseconds)")
           seconds = Myseconds
   
           slider.value = 0.0
           slider.maximumValue = Float(Myseconds)
           player!.play()
           timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(self.updateSlider), userInfo: nil, repeats: true)
           slider.addTarget(self, action: #selector(playbackSliderValueChanged(_:)), for: .valueChanged)
             UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {

             }) { (completeAnimation) in
        }
    }
       @objc func playbackSliderValueChanged(_ playbackSlider:UISlider) {
            let seconds : Int64 = Int64(slider.value)
            let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
            
            player!.seek(to: targetTime)
            
            if player!.rate == 0
            {
                player?.play()
            }
        }
       
       @objc func updateSlider() {
           let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
           slider.value = Float(time)
           let remainingTimeInSeconds = seconds - time
         
           timeElapsedLabel.text =  getFormattedTime(timeInterval: remainingTimeInSeconds)
           timeRemainigLabel.text = getFormattedTime(timeInterval: time)
       }
    
    func getFormattedTime(timeInterval: TimeInterval) -> String {
           let mins = timeInterval / 60
           let secs = timeInterval.truncatingRemainder(dividingBy: 60)
           let timeformatter = NumberFormatter()
           timeformatter.minimumIntegerDigits = 2
           timeformatter.minimumFractionDigits = 0
           timeformatter.roundingMode = .down
           guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
               return ""
           }
           return "\(minsStr):\(secsStr)"
       }
    
    
}
