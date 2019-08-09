//
//  UnplashImages.swift
//  Do-Pinterest
//
//  Created by adonis rumbwere on 9/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLS
}

enum URLS: String,Codable {
    case raw, full, regular, small, thumb
}
