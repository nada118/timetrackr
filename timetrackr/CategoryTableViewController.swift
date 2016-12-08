//
//  CategoryTableViewController.swift
//  timetrackr
//
//  Created by Nada Al-Alusi on 12/5/16.
//  Copyright © 2016 Nada Al-Alusi. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    //MARK: Properties
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        loadSampleCat()
    }
    
    
    func loadSampleCat(){
        let cat1 = Category(name: "Study", goal: "5")
        let cat2 = Category(name: "Workout", goal: "1")
        categories += [cat1!, cat2!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "categoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CategoryTableViewCell2
        
        let category = categories[indexPath.row]
        
        cell.categoryLabel2.text = category.name
        var g = "Daily Goal: " + category.goal
        let goalt = category.goal
        if (goalt == "1"){
            g += " Hour"
        } else {
            g += " Hours"
        }
        
        cell.goalLabel.text = g
    
        
        cell.completedLabel.text = category.timeLabel
        
        // Configure the cell...

        return cell
    }
    
    @IBAction func unwindToCategoryList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? CategoryViewController2, let category = sourceViewController.category{
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                categories[selectedIndexPath.row] = category
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = NSIndexPath(row: categories.count, section: 0)
                categories.append(category)
                tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            }
            
            
        }
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            print(indexPath.row)
            categories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail" {
            let categoryDetailViewController = segue.destination as! CategoryViewController2
            
            if let selectedCategoryCell = sender as? CategoryTableViewCell2 {
                let indexPath = tableView.indexPath(for: selectedCategoryCell)
                let selectedCategory = categories[(indexPath?.row)!]
                categoryDetailViewController.category = selectedCategory
            }
            
        } else if segue.identifier == "AddItem" {
            print("Adding new category.")
        }
        
    }
 

}
