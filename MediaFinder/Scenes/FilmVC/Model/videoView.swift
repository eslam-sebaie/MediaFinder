//
//  videoView.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 4/2/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class VideoPlayerView: UIView {
    var player: AVPlayer?
    var urlPrev: String!
    
    override init(frame: CGRect) {
       super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
