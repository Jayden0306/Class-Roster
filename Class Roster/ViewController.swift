//
//  ViewController.swift
//  Class Roster
//
//  Created by Jayden Tan on 2/19/15.
//  Copyright (c) 2015 JaydenT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var people = [Person]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        var apple = Person(firstName: "Apple", lastName: "Chen")
        var brian = Person(firstName: "Brian", lastName: "Whinsky")
        var cathy = Person(firstName: "Cathy", lastName: "Taylor")
        var debby = Person(firstName: "Debby", lastName: "Rivera")
        var eddit = Person(firstName: "Eddit", lastName: "Ho")
        people += [apple, brian, cathy, debby, eddit]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = "Home"
        
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let person = self.people[indexPath.row]
        
        cell.textLabel?.text = person.firstName + " " + person.lastName
        return cell
    }
  }

