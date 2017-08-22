//
//  DetailViewController.swift
//  ThreeDayDemo
//
//  Created by ya Liu on 2017/8/22.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextLabel: UILabel!
    
    
    @IBOutlet weak var picImageView: UIImageView!
    
    var detailCandy: ListItem? {
        didSet {
            configureView()

        }
    }
    
    
    func configureView() {
        if let detailCandy = detailCandy {
            if let detailDescriptionLabel = titleTextLabel, let candyImageView = picImageView {
                detailDescriptionLabel.text = detailCandy.name
                candyImageView.image = UIImage(named: detailCandy.name)
                title = detailCandy.category
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

    }

}
