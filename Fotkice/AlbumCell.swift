import UIKit

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    var album: AlbumInfo?
    
    func setAlbumData(album: AlbumInfo) {
        self.album = album
        
        updateData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateData()
    }
    
    func updateData() {
        if let album = album, title != nil {
            title.text = album.name
        }
    }
}
