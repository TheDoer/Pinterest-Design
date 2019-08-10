//
//  UnsplashClient.swift
//  Do-Pinterest
//
//  Created by adonis rumbwere on 10/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import Foundation
class UnplashClient: APIClient {
    static let baseURL = "https://api.unsplash.com/"
    static let apiKey =  "ba02d424b319744a2773289a232f5552214996d1294b59ac7a819a1257e3aabf"
    
    func fetch(with endpoint: UnspashEndpoint, completion: @escaping (Either<Photo>) -> Void) {
    }
    
}


