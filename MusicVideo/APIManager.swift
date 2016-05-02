//
//  APIManager.swift
//  MusicVideo
//
//  Created by Tatiwat Borwornrattanakit on 5/2/2559 BE.
//  Copyright © 2559 Tatiwat Borwornrattanakit. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString: String, completion: (result: String) -> Void) {

        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
        //let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }
            }
            else {
                //print(data)
                do {
                    /* AllowFragment - top level object is not Array or Dictionary.
                    Any type of String or value
                    NSJSONSerialization requires the Do / Try / Catch
                    Converts the NSDATA into a JSON Object and cast it to a Dictionary */
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary {
                        
                        print(json)
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0)) {
                            dispatch_async(dispatch_get_main_queue()) {
                                completion(result: "JSONSerialization Successful")
                            }
                        }
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: "error in NSJSONSerialization")
                    }
                }
            }
            
        }
        task.resume()
    }
}
