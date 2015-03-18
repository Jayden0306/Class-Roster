//
//  ViewController.swift
//  Class Roster
//
//  Created by Jayden Tan on 2/19/15.
//  Copyright (c) 2015 JaydenT. All rights reserved.
//

import UIKit

//conform protocals
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var people = [Person]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadFromArchive()
        
        if self.people.isEmpty {
            if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist") {
                println(filePath)
                //NSArray is objective c version of array. NS is next step
                //NSArray has a constructor property take a file path
                if let plistArray = NSArray(contentsOfFile: filePath) {
                    // println(plistArray.count)
                    for personObject in plistArray {
                        if let personDictionary = personObject as? NSDictionary {
                            let firstName = personDictionary["firstName"] as String
                            let lastName = personDictionary["lastName"] as String
                            let person = Person(firstName: firstName, lastName: lastName)
                            self.people.append(person)
                        }
                    }
                } else {
                    
                }
            }
            self.saveToArchive()
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = "Home"
        
    }
    
    func loadFromArchive() {
        let path = getDocumentsPath()
        let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/MyArchive") as [Person]
        self.people = arrayFromArchive
    }
    
    func saveToArchive() {
        let path = self.getDocumentsPath()
        NSKeyedArchiver.archiveRootObject(self.people, toFile: path + "/MyArchive")
    }
    
    func getDocumentsPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let path = paths.first as String
        return path
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.saveToArchive()
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPerson" {
            let personDetailViewController = segue.destinationViewController as PersonDetailViewController
            //asking the table view for the selected index path, because we need to know which row they clicked on
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            //figures out which person they clicked on
            let person = self.people[selectedIndexPath!.row]
            //passing the person to our destination view controller
            personDetailViewController.selectedPerson = person
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    //ask table view to get a cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //dequeue the cell mean add a cell to the aray
        //index path = section in a row
        // "as UITableView" treat it like a UITableView Cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
        
        let personToDisplay = self.people[indexPath.row]
        
        //the ? will ask textLabel, if the textlabel is nil, it is not going to print
//        cell.textLabel?.text = person.firstName + " " + person.lastName
        cell.personLabel.text = personToDisplay.firstName
        
        if personToDisplay.image != nil {
            cell.personImageView.image = personToDisplay.image
        } else {
            cell.personImageView.image = UIImage(named: "contacts.png")
        }
        return cell
    }
  }

