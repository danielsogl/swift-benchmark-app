//
//  HttpController.swift
//  swift-benchmark-app
//
//  Created by Daniel Sogl on 20.10.17.
//  Copyright © 2017 Daniel Sogl. All rights reserved.
//

import UIKit
import Alamofire

class HttpController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getComments(_ sender: Any) {
        var counter = 0
        let start = CACurrentMediaTime()
        for i in 1...50 {
            Alamofire.request("https://jsonplaceholder.typicode.com/comments/\(i)").responseJSON { response in
                    counter += 1
                    if(counter == 50) {
                        let end = CACurrentMediaTime()
                        print("GET finished in \(end-start)s")
                    }
            }
        }
    }
    
    @IBAction func postComments(_ sender: Any) {
        var counter = 0
        let start = CACurrentMediaTime()
        for i in 1...50 {
            let parameters: Parameters = [
                "id": i,
                "name": "Lorem Ipsum",
                "email": "test@mail.com",
                "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
            ]
            
            Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                counter += 1
                if(counter == 50) {
                    let end = CACurrentMediaTime()
                    print("POST finished in \(end-start)s")
                }
            }
        }
    }
    
    @IBAction func putComments(_ sender: Any) {
        var counter = 0
        let start = CACurrentMediaTime()
        for i in 1...50 {
            let parameters: Parameters = [
                "id": i,
                "name": "Lorem Ipsum",
                "email": "test@mail.com",
                "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
            ]
            
            Alamofire.request("https://httpbin.org/put", method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                counter += 1
                if(counter == 50) {
                    let end = CACurrentMediaTime()
                    print("PUT finished in \(end-start)s")
                }
            }
        }
    }
    
    @IBAction func deleteComments(_ sender: Any) {
        var counter = 0
        let start = CACurrentMediaTime()
        for i in 1...50 {
            Alamofire.request("https://jsonplaceholder.typicode.com/comments/\(i)", method: .delete).responseString { response in
                    counter += 1
                    if(counter == 50) {
                        let end = CACurrentMediaTime()
                        print("DELETE finished in \(end-start)s")
                    }
            }

        }
    }
    
}
