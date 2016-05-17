//
//  VC2.swift
//  XHorizontalView
//
//  Created by X on 16/5/13.
//  Copyright © 2016年 XHorizontalView. All rights reserved.
//

import UIKit

class VC2: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.backgroundColor = UIColor.greenColor()
        
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.delegate = self
        table.dataSource = self
        
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        table.tableFooterView = view
        table.tableHeaderView = view
        
        self.view.addSubview(table)
        
        table.snp_makeConstraints { (make) in
            make.top.equalTo(10.0)
            make.bottom.equalTo(-15.0)
            make.leading.equalTo(0.0)
            make.trailing.equalTo(-40.0)
        }
        
//        let label = UILabel()
//        label.text = "VC2"
//        label.textAlignment = .Center
//        label.font = UIFont.systemFontOfSize(30.0)
//        self.view.addSubview(label)
//        
//        label.snp_makeConstraints { (make) in
//            make.center.equalTo(self.view)
//        }
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return 20
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 60.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        cell.textLabel?.font = UIFont.systemFontOfSize(20.0)
        
        
        return cell
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
    }
}
