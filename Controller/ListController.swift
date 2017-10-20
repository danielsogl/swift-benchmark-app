//
//  ListController.swift
//  swift-benchmark-app
//
//  Created by Daniel Sogl on 20.10.17.
//  Copyright © 2017 Daniel Sogl. All rights reserved.
//

import UIKit

class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //MARK: Properties
    @IBOutlet weak var listView: UITableView!
    
    var items = [ListItem]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(items[indexPath.row].name)"
        return cell
    }
    
    @IBAction func creatItems(_ sender: Any) {
        items = build();
        listView.reloadData()
    }
    
    @IBAction func createLotsItems(_ sender: Any) {
        items = build(count: 10000);
        listView.reloadData()
    }
    
    @IBAction func append(_ sender: Any) {
        items.append(contentsOf: build())
        listView.reloadData()
    }
    
    @IBAction func update(_ sender: Any) {
        for index in stride(from: 0, to: items.count, by: 10) {
            items[index].name += " !!!"
        }
        listView.reloadData()
    }
    
    @IBAction func clear(_ sender: Any) {
        items.removeAll()
        listView.reloadData()
    }
    
    //MARK: Private Methods
    private func build(count: Int = 1000) -> [ListItem] {
        var data = [ListItem]()
        var adjectives = ["pretty", "large", "big", "small", "tall", "short", "long", "handsome", "plain", "quaint", "clean", "elegant", "easy", "angry", "crazy", "helpful", "mushy", "odd", "unsightly", "adorable", "important", "inexpensive", "cheap", "expensive", "fancy"];
        var colours = ["red", "yellow", "blue", "green", "pink", "brown", "purple", "brown", "white", "black", "orange"];
        var nouns = ["table", "chair", "house", "bbq", "desk", "car", "pony", "cookie", "sandwich", "burger", "pizza", "mouse", "keyboard"];
        
        for index in 0...count {
            let label = "\(adjectives[randomNumber(min: 0, max: adjectives.count)]) \(colours[randomNumber(min: 0, max: colours.count)]) \(nouns[randomNumber(min: 0, max: nouns.count)])"
            data.insert(ListItem(name: label, id: 4), at: index)
        }
        return data
    }
    
    private func randomNumber(min: Int, max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
        return randomNum
    }
}
