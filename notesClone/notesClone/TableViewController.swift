//
//  TableViewController.swift
//  notesClone
//
//  Created by Kaelen Cook on 11/14/19.
//  Copyright © 2019 Kaelen Cook. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var plusButton: UIBarButtonItem!
    
    var notes:[Note] = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let note1 = Note()
        note1.note = "Hello! Welcome to Notes-2.o!"
        notes.append(note1)
        
        let note2 = Note()
        note2.note = "This is another note pertaining to Notes-2.o!"
        notes.append(note2)
        
        let note3 = Note()
        note3.note = "Stop looking at these notes! Notes-2.o! is a versatile tool and you can add your own!"
        notes.append(note3)
        
        let note4 = Note()
        note4.note = "yeah I mean this person just keeps looking at my notes, I'm trying to stop him but I don't know how much longer I can keep him away"
        notes.append(note4)
        
        let note5 = Note()
        note5.note = "Hey! There's nothing here! Stop looking!"
        notes.append(note5)
        
        let note6 = Note()
        note6.note = "this person is hecking persistent! Soon they'll find out that Notes-2.o! is just a clone of Notes!"
        notes.append(note6)
        
        let note7 = Note()
        note7.note = "Alright, you win. Notes-2.o! is just a clone of Notes. I can no longer stop you from perusing my notes. Look at whatever you want, I'm done."
        notes.append(note7)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let title = notes[indexPath.row].note
        cell.textLabel!.text = title
        // Configure the cell...
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        if indexPath != nil {
            vc.note = notes[indexPath!.row]
        }
        else {
            let newNote = Note()
            newNote.note = "New Note"
            notes.append(newNote)
            vc.note = newNote
        }
        
    }

}
