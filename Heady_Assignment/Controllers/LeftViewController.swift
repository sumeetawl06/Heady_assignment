//
//  LeftViewController.swift
//  Heady_Assignment
//
//  Created by Sumeet Agrawal on 12/2/17.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import PureLayout

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    var selectedSection:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.addTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func getureRecgnizer(_ sender: UITapGestureRecognizer) {
        print("Please Help!")
        let section = sender.view
        
        self.selectedSection = (section?.tag)!
        
        let indexes:NSArray = self.getIndexesArray(numberOfRows: 5, atSection: 0)
        
        self.tableView.beginUpdates()
        
        self.tableView.insertRows(at: indexes as! [IndexPath], with: UITableViewRowAnimation.fade)
        
        self.tableView.endUpdates()
        self.tableView.reloadData()
    }
    
    func addTableView (){
            
        self.tableView = UITableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
        self.view.addSubview(self.tableView)
        self.tableView.autoPinEdge(toSuperviewEdge: ALEdge.top, withInset: 0)
        self.tableView.autoPinEdge(toSuperviewEdge: ALEdge.bottom, withInset: 0)
        self.tableView.autoPinEdge(toSuperviewEdge: ALEdge.left, withInset: 0)
        self.tableView.autoPinEdge(toSuperviewEdge: ALEdge.right, withInset: 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell")!
        cell.textLabel?.text = "Temporary"
        return cell;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 25;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == selectedSection {
            
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        
        let label = UILabel.init()
        if section==0 {
            label.text = "Category"
        }else {
            
            label.text = "Sub-Category"
        }
        headerView.addSubview(label)
        label.autoPinEdge(toSuperviewEdge: ALEdge.left, withInset: 10)
        label.autoAlignAxis(ALAxis.horizontal, toSameAxisOf: headerView)
        
        headerView.tag = section
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.getureRecgnizer(_:)))
        headerView.addGestureRecognizer(tapGesture)
        return headerView;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 2
        
    }
    
    func getIndexesArray(numberOfRows rows:Int , atSection section:Int) -> NSMutableArray {
        
        var indexpaths:NSMutableArray = NSMutableArray.init()
        
        for i in stride(from: 0, to: rows, by: 1) {
            
            indexpaths.add(NSIndexPath(row: i, section: section))
        }
        
        
        return indexpaths
    }
}
