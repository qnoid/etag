//
//  ViewController.swift
//  Etag
//
//  Created by Markos Charatzas on 09/04/2016.
//  Copyright © 2016 Markos Charatzas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let sessionDataTask = session.dataTaskWithURL((NSURL(string: "http://qnoid.com/assets/images/avatar.jpg")!)) { [weak imageView = self.imageView] data, response, _ in
            
            guard let _imageView = imageView else {
                return
            }
            
            let response = response as! NSHTTPURLResponse
            debugPrint(response.allHeaderFields)
            
            dispatch_async(dispatch_get_main_queue()){
                _imageView.image = UIImage(data: data!)
            }

        }
        
        sessionDataTask.resume()

    }
}
