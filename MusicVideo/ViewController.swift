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

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.reachabilityStatusChanges), name: "ReachStatusChanged", object: nil)
        reachabilityStatusChanges()
        
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
    
    func reachabilityStatusChanges() {
        
        switch reachabilityStatus {
            case NOACCESS: view.backgroundColor = UIColor.redColor()
                            displayLabel.text = "No Internet"
            case WIFI: view.backgroundColor = UIColor.greenColor()
                            displayLabel.text = "Reachable with WIFI"
            case WWAN: view.backgroundColor = UIColor.yellowColor()
                            displayLabel.text = "Reachable with Cellular"
            
            default: return
        }
        
    }

    // Is call just as the object is about to be deallocated
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    }
    
}

