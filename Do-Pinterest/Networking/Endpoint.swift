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

enum Un {
    case <#case#>
}
