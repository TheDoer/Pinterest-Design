//
//  UnsplashImages.swift
//  Do-Pinterest
//
//  Created by adonis rumbwere on 10/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}
