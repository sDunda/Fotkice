//
//  CollectionViewCell.swift
//  NavigationControllerExample
//
//  Created by Ivan Blagajić on 11/01/2017.
//  Copyright © 2017 Five. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    private var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        addSubview(imageView)
    }
    
    func setup(image: UIImage) {
        backgroundColor = .red
      //  imageView.contentMode = .redraw
        imageView.image = image
    }
    
}
