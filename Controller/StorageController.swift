//
//  StorageController.swift
//  swift-benchmark-app
//
//  Created by Daniel Sogl on 20.10.17.
//  Copyright © 2017 Daniel Sogl. All rights reserved.
//

import UIKit

class StorageController: UIViewController {
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func storeList(_ sender: Any) {
        var items = [Data]()
        
        for i in 0...10 {
            items.insert(Data(id: i, body: "Lorem Ipsum"), at: i)
        }
        let start = CACurrentMediaTime()
        defaults.set(items, forKey:"items")
        let end = CACurrentMediaTime()
        print("Store item list finished in \(end-start)s")
    }
    
    @IBAction func storeSingle(_ sender: Any) {
        let start = CACurrentMediaTime()
        defaults.set(25, forKey: "Age")
//        for i in 0...1000 {
//            defaults.set(Data(id: i, body: "Lorem Ipsum"), forKey:"item_\(i)")
//        }
        let end = CACurrentMediaTime()
        print("Store single items finished in \(end-start)s")
    }
    
    @IBAction func readList(_ sender: Any) {
        let start = CACurrentMediaTime()
        defaults.array(forKey: "items")
        let end = CACurrentMediaTime()
        print("Read item list finished in \(end-start)s")
    }
    
    @IBAction func readSingle(_ sender: Any) {
        let start = CACurrentMediaTime()
        defaults.string(forKey: "Age")
//        for i in 0...1000 {
//            defaults.object(forKey: "item_\(i)")
//        }
        let end = CACurrentMediaTime()
        print("Read single items finished in \(end-start)s")
    }
    
}

class Data {
    //MARK: Properties
    
    var body: String
    var id: Int
    
    //MARK: Initialization
    
    init(id: Int, body: String) {
        
        // Initialize stored properties.
        self.body = body
        self.id = id
        
    }
}
