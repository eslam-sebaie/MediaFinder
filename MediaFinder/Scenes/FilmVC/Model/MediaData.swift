//
//  MediaData.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/30/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
enum mediaInfo: String {

    case tvShow = "tvShow"
    case movie = "movie"
    case music = "music"

}
struct MediaData: Decodable {
    
    var artworkUrl100: String
    var artistName: String?
    var trackName: String?
    var longDescription: String?
    var previewUrl: String
    var kind: String?
    
    func getType() -> mediaInfo{
        
        switch self.kind {
        case "song":
            return mediaInfo.music
            case "feature-movie":
                return mediaInfo.movie
            case "tv-episode":
                return mediaInfo.tvShow
        default:
            return mediaInfo.music
        }
    }
}
