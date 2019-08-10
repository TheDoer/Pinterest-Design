//
//  Endpoint.swift
//  Do-Pinterest
//
//  Created by adonis rumbwere on 9/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var urlParameters: [URLQueryItem] { get }
}

enum Order: String {
    case popular, latest, oldest
}

enum UnspashEndpoint: Endpoint {
    case photos(id: String, order: Order)
    
    var baseUrl: String {
        return "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    
    var urlParameters: [URLQueryItem] {
        switch self {
        case .photos(let id, let order):
            return [
                URLQueryItem(name: "client_id", value: id),
                URLQueryItem(name: "order_by", value: order.rawValue)
            ]
        }
    }
}


