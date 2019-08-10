//
//  ViewModel.swift
//  Do-Pinterest
//
//  Created by adonis rumbwere on 10/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import UIKit

struct cellViewModel {
    let image: UIImage
}

class ViewModel {
    
    //MARK: Properies
    
    private let client: APIClient
    private var photos: Photos = [] {
        
        didSet{
            self.fetchPhoto()
        }
    }
    var cellViewModels: [cellViewModel] = []
    
    
    //MARK: UI
    
    var isloading: Bool = false {
        didSet {
            showLoading?()
            
        }
    }
    
    //Closures
    
    var showLoading: (() -> Void)?
    var reloadData: (() -> Void)?
    var showError: ((Error) -> Void)?
    
    init(client : APIClient) {
            self.client = client
    }
    
    func fetchPhotos() {
        if let client = client as? UnsplashClient {
            self.isloading = true
            let endpoint = UnspashEndpoint.photos(id: UnsplashClient.apiKey, order: .popular)
            client.fetch(with: endpoint) { (either) in
                switch either {
                case .success(let photos):
                    self.photos = photos
                case .error(let error):
                    self.showError?(error)
                }
            }
            }
        }
    
    private func fetchPhoto() {
        
        //Warning: This is happening on the main thread, this may lock up the UI and gives poor experience.
        
        let group = DispatchGroup()
        
        self.photos.forEach { (photo) in
            
            //This will run asynchrous request
            DispatchQueue.global(qos: .background).async(group: group){
                
                group.enter()
                    guard (try? Data(contentsOf: URL(string: "")!)) != nil else {
                        self.showError?(APIError.unknown)
                        return
                        
                    }
                    guard let image = UIImage(data: Data) else {
                        self.showError?(APIError.unknown)
                        return
                    }
                
                    //When it finish looping it will be appending to this
                
                    self.cellViewModels.append(cellViewModels(image: image))
                    group.leave()
                    }
        }
        group.notify(queue: main){
            self.isloading = false
            self.reloadData?()
        }
    }
    

    }

