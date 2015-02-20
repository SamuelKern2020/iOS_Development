//
//  NotesTableTableViewController.swift
//  NotesPractice3
//
//  Created by Samuel Kern on 2/19/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class NotesTableTableViewController: UITableViewController {

    var notesInTable = [Note]()     //An array that will contain all of our notes
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var note1 = Note()
        note1.title = "Note 1"
        note1.content = "Note 1 content"
        
        var note2 = Note()
        note2.title = "Note 2"
        note2.content = "Note 2 content"
        
        var note3 = Note()
        note3.title = "Note 3"
        note3.content = "Note 3 content"
        
        notesInTable.extend([note1, note2, note3])
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return notesInTable.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel!.text = notesInTable[indexPath.row].title
        
         //cell.textLabel!.text = "Notes go here"
        
        return cell
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //Deletion steps:
        notesInTable.removeAtIndex(indexPath.row)   //First delete the note from the notesInTable array
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)  //Then delete the cell from the table view

    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show_Note"{
            // Get the new view controller and cast it to be a NoteDetailViewController
            var newDetailViewController = segue.destinationViewController as NoteDetailViewController
            //Determine the index path to the cooresponding Note object
            var indexPathToNextView = tableView.indexPathForSelectedRow()
            
            // Pass the selected note object to the new view controller.
            newDetailViewController.note = notesInTable[indexPathToNextView!.row]

        }
        
        else if segue.identifier == "Add_Note"{
            let newNote = Note()
            notesInTable.append(newNote)
            // Get the new view controller and cast it to be a NoteDetailViewController
            var newDetailViewController = segue.destinationViewController as NoteDetailViewController
        
            //Have the segued detail view disply the new note:
            newDetailViewController.note = newNote

        }
        
        
           }
    
    
    
    //Reloads the cell data each time view is activated
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
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

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    

    
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
