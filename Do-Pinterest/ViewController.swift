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
    
    let images = [#imageLiteral(resourceName: "image-4"),#imageLiteral(resourceName: "image-2"),#imageLiteral(resourceName: "image-1"),#imageLiteral(resourceName: "image-3"),#imageLiteral(resourceName: "image-5")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // view.backgroundColor = .white
    }

}

//MARK: FLow Layout Delegate

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->
        CGSize {
            
            let numberOfColums:CGFloat = 2
            let width = collectionView.frame.size.width
            let xInserts:CGFloat = 10
            let cellSpacing:CGFloat = 5
        
        
        return CGSize(width: (width / numberOfColums) - (xInserts + cellSpacing), height: (width / numberOfColums) - (xInserts + cellSpacing))
    }
}



//MARK: Data Source

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let image = images[indexPath.item]
        cell.imageView.image = image
        
        return cell
    }
}


