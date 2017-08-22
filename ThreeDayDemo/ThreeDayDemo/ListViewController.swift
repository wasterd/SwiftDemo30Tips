//
//  ListViewController.swift
//  ThreeDayDemo
//
//  Created by ya Liu on 2017/8/22.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    //MARK - properties
    var detailViewController: DetailViewController? = nil
    
    var candies = [ListItem]()
    
    var filteredCandies = [ListItem]()
    
    let searchController = UISearchController.init(searchResultsController: nil)
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        candies = [
            ListItem(category:"Chocolate", name:"Chocolate Bar"),
            ListItem(category:"Chocolate", name:"Chocolate Chip"),
            ListItem(category:"Chocolate", name:"Dark Chocolate"),
            ListItem(category:"Hard", name:"Lollipop"),
            ListItem(category:"Hard", name:"Candy Cane"),
            ListItem(category:"Hard", name:"Jaw Breaker"),
            ListItem(category:"Other", name:"Caramel"),
            ListItem(category:"Other", name:"Sour Chew"),
            ListItem(category:"Other", name:"Gummi Bear")
        ]
        
        setupSearchController()
        
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
  
    
    //MARK - Search Controller Setup
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All","Chocolate","Hard","Other"]
        searchController.searchBar.delegate = self
    }
    
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter({ (candy) -> Bool in
          
            if !(candy.category == scope) && scope != "All"{
                return false
            }
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText == ""
            
        })
        tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      
        if searchController.isActive {
            return filteredCandies.count
        }
        return candies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let candy: ListItem
        if searchController.isActive {
            candy = filteredCandies[indexPath.row]
        }else {
            candy = candies[indexPath.row]
        }
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
        
        return cell
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let candy: ListItem
                if searchController.isActive {
                    candy = filteredCandies[(indexPath as NSIndexPath).row]
                } else {
                    candy = candies[(indexPath as NSIndexPath).row]
                }
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailCandy = candy
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

extension ListViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension ListViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }

}



