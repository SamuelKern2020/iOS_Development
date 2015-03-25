//
//  IdeasTableViewController.swift
//  IdeaBoxTake4
//
//  Created by Samuel Kern on 3/12/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class IdeasTableViewController: UITableViewController {

    var ideasInTable = [Idea]()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var idea1 = Idea()
        idea1.name = "idea 1"
        idea1.description = "Idea 1 content"
        
        var idea2 = Idea()
        idea2.name = "idea 2"
        idea2.description = "Idea 2 content"

        
        
        ideasInTable.extend([idea1, idea2])
    }

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return ideasInTable.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IdeaCell", forIndexPath: indexPath) as UITableViewCell
        
//        let idea = ideasInTable[indexPath.row] as Idea //2
//        cell.cellTitle.text = idea.name
//        cell.cellDescription.text = idea.description
        
        //Using default UTTableViewCell connections:
        cell.textLabel!.text = ideasInTable[indexPath.row].name
        
        return cell

    }
    
    //Reloads the cell data each time view is activated
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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

 
    // - NAVIGATION -
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowIdea"{
            println("Made it to segue")
            //Get the new view controller and cast it to be a IdeaDetailViewController:
            var newDetailView = segue.destinationViewController as IdeaDetailViewController
            println("1")
            //Determine the index path for the selected cell:
            var ideaIndex = tableView.indexPathForSelectedRow()
            println("2")

            //Retrieve the cooresponding idea object from the ideasInTable array and pass it to the next view:
            newDetailView.detailedIdea = ideasInTable[ideaIndex!.row]
            println("3")

    
        }
    }
    
    

    @IBAction func cancelToIdeasTableViewController(segue:UIStoryboardSegue) {
        println("Entered cancelToIdeasTableViewController segue")
        
    }
    
    @IBAction func saveIdeaDetail(segue:UIStoryboardSegue) {
        println("Entered saveIdeaDetail segue")
        
        //Allows access to the AddIdeaViewController view
        let ideaDetailViewController = segue.sourceViewController as AddIdeaViewController
        
        //Sets variable names
        ideaDetailViewController.newIdea.name = ideaDetailViewController.newIdeaName.text
        ideaDetailViewController.newIdea.description = ideaDetailViewController.newIdeaDescription.text
    
        //Add the new idea to the ideasInTable array
        ideasInTable.append(ideaDetailViewController.newIdea)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: ideasInTable.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)


        
    }
    
    

}
