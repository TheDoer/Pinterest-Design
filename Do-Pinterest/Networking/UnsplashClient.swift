//
//  UnsplashClient.swift
//  Do-Pinterest
//
//  Created by adonis rumbwere on 10/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import Foundation

class UnsplashClient: APIClient {
    static let baseUrl = "https://api.unsplash.com"
    static let apiKey = "b139e535a8ce68be8515bb3eb7902519c3730535225b76a2f0eeee8fb6359242"
    
    func fetch(with endpoint: UnspashEndpoint, completion: @escaping (Either<Photos>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}
