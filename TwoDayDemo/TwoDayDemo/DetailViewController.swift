//
//  DetailViewController.swift
//  TwoDayDemo
//
//  Created by ya Liu on 2017/8/22.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    
    var selectedArtist: Artist!
    
    let moreInfoText = "Select For More Info >"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    tableView.estimatedRowHeight = 277
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.tableFooterView = UIView.init()
        
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    
    
}


extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Dcell", for: indexPath) as! DeatilTableViewCell
        
        let work = selectedArtist.works[indexPath.row] 
        cell.UrlImageView.image = UIImage.init(named: work.image)
        cell.titleContentLabel.text = work.title
        cell.textView.text = work.isExpanded ? work.info :  moreInfoText
        return cell
    }

}


extension DetailViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? DeatilTableViewCell else { return  }
        var work = selectedArtist.works[indexPath.row]

        work.isExpanded = !work.isExpanded
        selectedArtist.works[indexPath.row] = work
        
        cell.textView.text = work.isExpanded ?  work.info : moreInfoText
        cell.textView.textAlignment = work.isExpanded ? .left : .center
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }


}




