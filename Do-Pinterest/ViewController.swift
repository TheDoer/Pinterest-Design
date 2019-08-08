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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // view.backgroundColor = .white
    }


}

//MARK: Data Source

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
        return cell
    }
}


