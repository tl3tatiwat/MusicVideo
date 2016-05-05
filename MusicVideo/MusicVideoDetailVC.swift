//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by Tatiwat Borwornrattanakit on 5/5/2559 BE.
//  Copyright © 2559 Tatiwat Borwornrattanakit. All rights reserved.
//

import UIKit

class MusicVideoDetailVC: UIViewController {
    
    var videos: Videos!
    
    @IBOutlet weak var vName: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var vGenre: UILabel!
    @IBOutlet weak var vPrice: UILabel!
    @IBOutlet weak var vRights: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = videos.vArtist
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        vGenre.text = videos.vGenre
        
        if let imgData = videos.vImageData{
            videoImage.image = UIImage(data: imgData)
        }
        else {
            videoImage.image = UIImage(named: "imageNotAvailable")
        }
    }
}
