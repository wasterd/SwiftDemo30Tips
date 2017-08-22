//
//  ListViewController.swift
//  TwoDayDemo
//
//  Created by ya Liu on 2017/8/22.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let artists = Artist.getDataFromBundle()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView.init()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desination = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            {
            desination.selectedArtist = artists[indexPath.row]
        }
    }
}


extension ListViewController : UITableViewDelegate {

    
    

}

extension  ListViewController : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let artist = artists[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "listC", for: indexPath) as! ListCell
        cell.picImageView.image = artist.imge
        cell.nameTextlabel.text = artist.name
        cell.bioLabel.text = artist.bio
    return cell
    }


}
