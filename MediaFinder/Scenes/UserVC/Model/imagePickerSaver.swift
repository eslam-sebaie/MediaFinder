//
//  imagePickerSaver.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/9/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
struct imageSave {
  
    
    static func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
  static  func saveImage(image: UIImage) -> Bool {
        guard let data = image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileName1.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }

}
