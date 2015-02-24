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
        return notesInTable.count // Return the number of rows in the section.
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
    
    
    
    
    
    
    
    
    
    
    
    
   }
