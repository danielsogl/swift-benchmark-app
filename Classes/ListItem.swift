//
//  ListImte.swift
//  swift-benchmark-app
//
//  Created by Daniel Sogl on 20.10.17.
//  Copyright © 2017 Daniel Sogl. All rights reserved.
//

import UIKit


class ListItem {
    
    //MARK: Properties
    
    var name: String
    var id: Int
    
    //MARK: Initialization
    
    init(name: String, id: Int) {
        
        // Initialize stored properties.
        self.name = name
        self.id = id
        
    }
}
