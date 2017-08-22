//
//  LYLHomeViewController.swift
//  meilishuo
//
//  Created by ya Liu on 2017/7/26.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class LYLHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   var tableView: UITableView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: CGRect(x:0,y:0,width: self.view.bounds.width ,height: self.view.bounds.height), style:UITableViewStyle.grouped)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.showsVerticalScrollIndicator = false
        view.addSubview(self.tableView!)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell  = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier:"cell")
        }
        
        cell?.textLabel?.text = "测试数据"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect(x:0,y: 0, width: self.view.bounds.width,height: 300))
        headerView.backgroundColor = UIColor.yellow
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 300;
        
    }
    
    
    
    

}
