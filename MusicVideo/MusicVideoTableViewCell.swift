//
//  MusicVideoTableViewCell.swift
//  MusicVideo
//
//  Created by Tatiwat Borwornrattanakit on 5/4/2559 BE.
//  Copyright © 2559 Tatiwat Borwornrattanakit. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var musicTitle: UILabel!
    
    var video: Videos? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell() {
        
        musicTitle.text = video?.vName
        rank.text = "\(video!.vRank)"
        musicImage.image = UIImage(named: "imageNotAvailable")
        
    }

}
