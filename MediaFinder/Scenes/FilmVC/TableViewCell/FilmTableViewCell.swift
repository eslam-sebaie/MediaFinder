//
//  FilmTableViewCell.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 2/14/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import SDWebImage
import Kingfisher
var newName = ""
class FilmTableViewCell: UITableViewCell {

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmName: UILabel!
    
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        filmImage.center.x = self.viewCell.frame.width + 30
        UIView.animate(withDuration: 5.0, delay: 00, options: .curveEaseIn, animations: {
            self.filmImage.center.x = self.viewCell.frame.width
        }, completion: nil)
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configureCell(media:MediaData) {
      
        let typeOfMedia = media.getType()
        if typeOfMedia == mediaInfo.tvShow {
            filmName.text = media.artistName
        }
        else if typeOfMedia == mediaInfo.movie || typeOfMedia == mediaInfo.music {
            filmName.text = media.trackName
        }
        if typeOfMedia == mediaInfo.music {
            filmDescription.text = media.artistName
            
        }
        else if typeOfMedia == mediaInfo.tvShow || typeOfMedia == mediaInfo.movie {
            filmDescription.text = media.longDescription
           
        }
        let url = URL(string: media.artworkUrl100)
        filmImage.kf.setImage(with: url)
    }

}
