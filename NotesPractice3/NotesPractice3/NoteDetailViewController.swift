//
//  NoteDetailViewController.swift
//  NotesPractice3
//
//  Created by Samuel Kern on 2/19/15.
//  Copyright (c) 2015 Samuel Kern. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    
    var note = Note()   //New instance of a note
    
    
    @IBOutlet weak var noteTitle: UITextField!
    
    @IBOutlet weak var noteDescription: UITextView!
    
    
    override func viewWillAppear(animated: Bool) {
        //Do before view loads:
        noteTitle.text = note.title         //Set title
        noteDescription.text = note.content   //Set description
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        //Save settings before view changes:
        note.title = noteTitle.text
        note.content = noteDescription.text
        //
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
