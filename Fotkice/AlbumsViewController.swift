//
//  AlbumsViewController.swift
//  Fotkice
//
//  Created by D&M on 07.02.2017..
//  Copyright © 2017. Dunja Sasic. All rights reserved.
//

import UIKit

struct AlbumInfo {
    var name: String = ""
    var photos: [String] = []
    var images: [UIImage]
    
    init(name: String, photos: [String]) {
        self.name = name
        self.photos = photos
        
        images = photos.map { UIImage(named: $0)! }
    }
    

}

class AlbumsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let stare_Slike = AlbumInfo(name:"Stare slike", photos: (0...20).map { "slika_0_StareSlike_\($0)" })

    let random = AlbumInfo(name:"Random", photos:
        ["slika_1_Random_0.jpg",
        "slika_1_Random_1.jpg",
        "slika_1_Random_2.jpg",
        "slika_1_Random_3.jpg",
        "slika_1_Random_4.jpg",
        "slika_1_Random_5.jpg",
        "slika_1_Random_6.jpg"])
    
    let priroda = AlbumInfo(name:"Priroda", photos:
        ["slika_2_Priroda_0.jpg",
        "slika_2_Priroda_1.jpg",
        "slika_2_Priroda_2.jpg",
        "slika_2_Priroda_3.jpg",
        "slika_2_Priroda_4.jpg",
        "slika_2_Priroda_5.jpg",
        "slika_2_Priroda_6.jpg",
        "slika_2_Priroda_7.jpg",
        "slika_2_Priroda_8.jpg",
        "slika_2_Priroda_9.jpg",
        "slika_2_Priroda_10.jpg"])
    
    let grad = AlbumInfo(name:"Grad", photos:
        ["slika_3_Grad_0.jpg",
         "slika_3_Grad_1.jpg",
         "slika_3_Grad_2.jpg",
         "slika_3_Grad_3.jpg",
         "slika_3_Grad_4.jpg",
         "slika_3_Grad_5.jpg",
         "slika_3_Grad_6.jpg",
         "slika_3_Grad_7.jpg",
         "slika_3_Grad_8.jpg",
         "slika_3_Grad_9.jpg",
         "slika_3_Grad_10.jpg",
         "slika_3_Grad_11.jpg",
         "slika_3_Grad_12.jpg",
         "slika_3_Grad_13.jpg",
         "slika_3_Grad_14.jpg",
         "slika_3_Grad_15.jpg",
         "slika_3_Grad_16.jpg"])
    
    let odmor = AlbumInfo(name:"Odmor", photos:
        ["slika_4_Odmor_0.jpg",
        "slika_4_Odmor_1.jpg",
        "slika_4_Odmor_2.jpg",
        "slika_4_Odmor_3.jpg"])
    
    let privatno = AlbumInfo(name:"Privatno", photos:
        ["slika_5_Privatno_0.jpg"])
    
    let sviAlbumi: [AlbumInfo]
    
    var tableView: AlbumsTableView!
    
    init() {
        sviAlbumi = [
            stare_Slike,
            random,
            priroda,
            grad,
            odmor,
            privatno
        ]
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Coder init not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView = AlbumsTableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), style: .grouped)
        
        tableView.register(UINib(nibName: "AlbumCell", bundle: Bundle.main), forCellReuseIdentifier: "AlbumCell")
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.title = "Albums"
    }
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell")
        
        if let cell = cell as? AlbumCell {
            cell.setAlbumData(album: sviAlbumi[indexPath.row])
            
            return cell
        } else {
            fatalError("Cell not registered")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (view.bounds.width - 3 * 10)/4, height: (view.bounds.width - 3 * 10)/4)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionViewController = PicturesViewController(collectionViewLayout: layout)
        collectionViewController.album = sviAlbumi[indexPath.row]
        
        navigationController?.pushViewController(collectionViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
