//
//  PicturesViewController.swift
//  Fotkice
//
//  Created by D&M on 07.02.2017..
//  Copyright © 2017. Dunja Sasic. All rights reserved.
//

import Foundation
import UIKit

class PicturesViewController: UICollectionViewController {
    
    var album: AlbumInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(PhotoCollectionCell.self,
                                 forCellWithReuseIdentifier: "PhotoCell")
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout,
//            let width = collectionView?.frame.width {
//            layout.itemSize = CGSize(width: width/2, height: width/2)
//        }
//    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0//album.photos.count
    }
    
//    override func collectionView(_ collectionView: UICollectionView,
//                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell",
//                                                      for: indexPath) as! PhotoCollectionCell
//        
//        cell.setup(image: UIImage(named: album.photos[indexPath.row])!)
//        return cell
//    }
//
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let secondViewController = SecondViewController(index: indexPath.row)
//        navigationController?.pushViewController(secondViewController, animated: true)
//    }
}
    
