//
//  CharacterScreenTVC.swift
//  savingApp
//
//  Created by Kaelen Cook on 1/23/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import UIKit

class CharacterScreenTVC: UITableViewController {
    
    var characters:[Character] = [
        Character(name:"Jon", hp: 200, klass: "Barbarian"),
        Character(name:"Billy", hp: 666, klass: "Literal Satan")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        load()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let title = characters[indexPath.row].name
        // Configure the cell...

        cell.textLabel!.text = title
        return cell
    }

    func getSaveFileURL() -> URL? {
        let myURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        if myURL != nil {
            return myURL!.appendingPathComponent("CharacterSaveFile.json")
        }
        return nil
    }
    
    func save() {
        let url = getSaveFileURL()
        if let url = url {
            let data = try? JSONSerialization.data(withJSONObject: characters, options: [])
            if let data = data {
                try? data.write(to: url)
            }
            else {
                print("Failure to save")
            }
        }
    }
    
    func load() {
        let url = getSaveFileURL()
        if let url = url {
            print(url)
            let data = try? Data(contentsOf: url)
            if let data = data {
                let decode = try? JSONDecoder().decode([Character].self, from: data)
                if let decode = decode {
                    characters = decode
                    print(characters)
                }
                else {
                    characters = []
                    print("3")
                }
            }
            else {
                print("2")
            }
        }
        else {
            print("1")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("hello")
        save()
        tableView.reloadData()
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
        let index = self.tableView.indexPathForSelectedRow
        if index != nil { 
            let infoVC = segue.destination as! MoreInfoVC
            infoVC.information = characters[index!.row]
        }
        else {
            print("Eureka")
        }
    }


}
