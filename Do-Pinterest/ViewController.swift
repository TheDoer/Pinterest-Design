//
//  ViewController.swift
//  Do-Pinterest
//
//  Created by adonis rumbwere on 8/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Properties
    
    let viewModel = ViewModel(client: UnsplashClient())
    
    //let images = [#imageLiteral(resourceName: "image-4"),#imageLiteral(resourceName: "image-2"),#imageLiteral(resourceName: "image-1"),#imageLiteral(resourceName: "image-3"),#imageLiteral(resourceName: "image-5"),#imageLiteral(resourceName: "image-6"),#imageLiteral(resourceName: "image-7"),#imageLiteral(resourceName: "image-8")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // view.backgroundColor = .white
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //init view Model
        
        //user self in a closure
        
        viewModel.showLoading = {
            if self.viewModel.isLoading {
                self.activityIndicator.startAnimating()
                self.collectionView.alpha = 0.0
            } else {
                self.activityIndicator.stopAnimating()
                self.collectionView.alpha = 1.0
            }
            
        }
        
        viewModel.showError = { error in
            print(error)
            
        }
        
        viewModel.reloadData = {
            self.collectionView.reloadData()
        }
        
        viewModel.fetchPhotos()
    }

}

//MARK: FLow Layout Delegate

//extension ViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->
//        CGSize {
//
//            let numberOfColums:CGFloat = 2
//            let width = collectionView.frame.size.width
//            let xInserts:CGFloat = 10
//            let cellSpacing:CGFloat = 5
//            let image = images[indexPath.item]
//            let height = image.size.height
//
//
//        return CGSize(width: (width / numberOfColums) - (xInserts + cellSpacing), height: height)
//    }
//}


extension ViewController: PinterestLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        let image = viewModel.cellViewModels[indexPath.item].image
        let height = image.size.height
        
        return height
    }
   
}

//MARK: Data Source

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let image = viewModel.cellViewModels[indexPath.item].image
        cell.imageView.image = image
        
        return cell
    }
}


