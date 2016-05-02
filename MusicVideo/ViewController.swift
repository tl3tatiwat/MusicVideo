//
//  ViewController.swift
//  MusicVideo
//
//  Created by Tatiwat Borwornrattanakit on 5/1/2559 BE.
//  Copyright © 2559 Tatiwat Borwornrattanakit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json",completion: didLoadData)
    }
    
    func didLoadData(videos: [Videos]) {
        
        //let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        //let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            //do something if you want
        //}
        
        //alert.addAction(okAction)
        //self.presentViewController(alert, animated: true, completion: nil)
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.vName)")
        }
        
    }

}

