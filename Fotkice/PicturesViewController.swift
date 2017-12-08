//
//  CollectionViewController.swift
//  NavigationControllerExample
//
//  Created by Ivan Blagajić on 11/01/2017.
//  Copyright © 2017 Five. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PicturesViewController: UICollectionViewController {

    var album: AlbumInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationItem.title = album.name
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.images.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! CollectionViewCell
        cell.setup(image: album.images[indexPath.row])
      
        return cell
    }


    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pictureDetailsViewController = PictureDetailsViewController(image: album.images[indexPath.row])
        
        
        navigationController?.pushViewController(pictureDetailsViewController, animated: true)
    }

}
