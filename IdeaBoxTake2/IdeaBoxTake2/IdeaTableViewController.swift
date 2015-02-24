//
//  IdeaTableViewController.swift
//  IdeaBoxTake2
//
//  Created by Samuel Kern on 2/23/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class IdeaTableViewController: UITableViewController {

    var ideasInTable = [Idea]()
    
    //Property Functions:
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideasInTable.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Idea_Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel!.text = ideasInTable[indexPath.row].title
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "Show_Idea"{
            var nextView = segue.destinationViewController as IdeaDetailViewController
            
            var indexPathToNextView = tableView.indexPathForSelectedRow()
            
            nextView.idea = ideasInTable[indexPathToNextView!.row]
            
        }
        else if segue.identifier == "Add_Idea"{
            let newIdea = Idea()
            ideasInTable.append(newIdea)
        
            var nextView = segue.destinationViewController as IdeaDetailViewController
            nextView.idea = newIdea

            
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //Deletion code:
        
        
        //
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    */

    

    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
