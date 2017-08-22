//
//  LYLForThePaymentViewController.swift
//  meilishuo
//
//  Created by ya Liu on 2017/7/26.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class LYLForThePaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let labeText = UILabel(frame:CGRect(x:0,y: 100,width:self.view.bounds.width,height: 30))
        labeText.textAlignment = .center
        labeText.font = UIFont.systemFont(ofSize: 16)
        labeText.textColor = UIColor.lightGray
        labeText.text = "待付款"
        view.addSubview(labeText)
        
    }
    
    
}
