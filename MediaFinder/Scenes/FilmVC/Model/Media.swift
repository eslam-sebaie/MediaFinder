//
//  Media.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/30/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
struct Media: Decodable {
    var resultCount: Int
    var results:[MediaData]
}
