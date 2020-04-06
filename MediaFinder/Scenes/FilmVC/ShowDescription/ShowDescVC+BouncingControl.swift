//
//  ShowDescVC+BouncingControl.swift
//  MediaFinder
//
//  Created by Eslam Sebaie on 4/6/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
extension ShowDescVC {
    @objc func bouncing(){
           descImage.center.x = self.viewImage.frame.width + 60
            UIView.animate(withDuration: 5.0, delay: 00, options: .curveEaseIn, animations: {
                self.descImage.center.x = self.viewImage.frame.width / 2
            }, completion: nil)
       }
       
       func repeatBouncing(){
          gameTimer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(bouncing), userInfo: nil, repeats: true)
           Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { timer in
               let randomNumber = Int.random(in: 1...20)
               print("Number: \(randomNumber)")

               if randomNumber == 10 {
                   timer.invalidate()
               }
           }
       }
}
