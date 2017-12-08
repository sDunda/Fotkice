//
//  PictureDetailsViewController.swift
//  Fotkice
//
//  Created by D&M on 07.02.2017..
//  Copyright © 2017. Dunja Sasic. All rights reserved.
//

import Foundation
import UIKit

class PictureDetailsViewController: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var image: UIImage!
    
    convenience init(image: UIImage){
        self.init()
        self.image = image
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        scrollView.addSubview(imageView)
        imageView.image = image
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self

    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
