//
//  ViewController.swift
//  HomeworkFix
//
//  Created by Nathan Ma on 8/23/14.
//  Copyright (c) 2014 Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
    
    var student = [Person]()
    
    var teacher = [Person]()
    
    var allArray = [[Person]]()
    
    
  
    
    
//    NSKeyedArchiver.archiveRootObject(people, toFile: documentsPath + "/archive")
//    
    
    
    
    
    
    
//MARK: View Methods
    
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
        if let people = NSKeyedUnarchiver.unarchiveObjectWithFile (documentsPath + "/archive2") as? [[Person]] {
            
            self.allArray = people
            
            
        } else {
            
            
            var nate = Person(fName: "Nate", lName: "Birkhol")
            var matthew = Person(fName: "Matthew", lName: "Brightbill")
            var jeff = Person(fName: "Jeff", lName: "Chavez")
            var christie = Person(fName: "Christie", lName: "Ferderer")
            var david = Person(fName: "David", lName: "Fry")
            var adrian = Person(fName: "Adrian", lName: "Gherle")
            var jake = Person(fName: "Jake", lName: "Hawken")
            var shams = Person(fName: "Shams", lName: "Kazi")
            var cameron = Person(fName: "Cameron", lName: "Klein")
            var kori = Person(fName: "Kori", lName: "Kolodziejczak")
            var parker = Person(fName: "Parker", lName: "Lewis")
            var nathan = Person(fName: "Nathan", lName: "Ma")
            var casey = Person(fName: "Casey", lName: "MacPhee")
            var brendan = Person(fName: "Brendan", lName: "McAleer")
            var brian = Person(fName: "Brian", lName: "Mendez")
            var mark = Person(fName: "Mark", lName: "Morris")
            var rowan = Person(fName: "Rowan", lName: "North")
            var kevin = Person(fName: "Kevin", lName: "Pham")
            var will = Person(fName: "Will", lName: "Richman")
            var heather = Person(fName: "Heather", lName: "Thueringer")
            var tuan = Person(fName: "Tuan", lName: "Vu")
            var zack = Person(fName: "Zack", lName: "Walkingstick")
            var sara = Person(fName: "Sara", lName: "Wong")
            var hongyao = Person(fName: "Hongyao", lName: "Zhang")
            
            var john = Person(fName: "John", lName: "Clem")
            var brad = Person(fName: "Brad", lName: "Johnson")
            
            student = [nate, matthew, jeff, christie, david, adrian, jake, shams, cameron, kori, parker, nathan, casey, brendan, brian, mark, rowan, kevin, will, heather, tuan, zack, sara, hongyao]
            
            teacher = [john, brad]
            
            allArray = [student, teacher]
            
        
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        NSKeyedArchiver.archiveRootObject(allArray, toFile: documentsPath + "/archive2")
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
//MARK: Functions
    
//    func initializePeople() {
//        self.student.append(Person(fName: "Nate", lName: "Birkholz"))
//        self.student.append(Person(fName: "Matthew", lName: "Brightbill"))
//        self.student.append(Person(fName: "Christie", lName: "Ferderer"))
//        self.student.append(Person(fName: "David", lName: "Fry"))
//        self.student.append(Person(fName: "Adrian", lName: "Gherle"))
//        self.student.append(Person(fName: "Jake", lName: "Hawken"))
//        self.student.append(Person(fName: "Shams",  lName: "Kazi"))
//        self.student.append(Person(fName: "Cameron", lName: "Klein"))
//        self.student.append(Person(fName: "Kori", lName: "Kolodziejczak"))
//        self.student.append(Person(fName: "Parker", lName: "Lewis"))
//        self.student.append(Person(fName: "Nathan", lName: "Ma"))
//        self.student.append(Person(fName: "Casey", lName: "MacPhee"))
//        self.student.append(Person(fName: "Brendan", lName: "McAleer"))
//        self.student.append(Person(fName: "Mark", lName: "Morris"))
//        self.student.append(Person(fName: "Rowan", lName: "North"))
//        self.student.append(Person(fName: "Kevin", lName: "Pham"))
//        self.student.append(Person(fName: "Will", lName: "Richman"))
//        self.student.append(Person(fName: "Heather", lName: "Thueringer"))
//        self.student.append(Person(fName: "Tuan", lName: "Vu"))
//        self.student.append(Person(fName: "Zack", lName: "Walkingstick"))
//        self.student.append(Person(fName: "Sara", lName: "Wong"))
//        self.student.append(Person(fName: "Hongyao", lName: "Zhang"))
//    }
//    
//    func initializeTeacher() {
//        self.teacher.append(Person(fName: "John", lName: "Clem"))
//        self.teacher.append(Person(fName: "Brad", lName: "Johnson"))
//    }
    
    
    
//MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return allArray[section].count
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return allArray.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = allArray[indexPath.section][indexPath.row].fullName()
        return cell
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        if section == 0 {
            return "Students"
        }
        
        else {
            
            return "Instructors"
        }
    }
//    
//    func addPerson() {
//        let studentAdd = self.storyboard.instantiateViewControllerWithIdentifier("newPersonDV") as DetailViewController
//        var person = Person(fName: "", lName: "")
//        people.append(person)
//        studentAdd.DTPersonProfile = person
//        if self.navigationController !=nil {
//            self.navigationController.pushViewController(studentAdd, animated: true)
//        }
//    }
    
//MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        let indexPath = self.tableView.indexPathForSelectedRow()
        
        if segue.identifier == "Push" {
            
            let indexPath = tableView.indexPathForSelectedRow()
                
                var destination = segue.destinationViewController as DetailViewController
                
                destination.DTPersonProfile = allArray[indexPath.section][indexPath.row]
            
        }else if segue.identifier == "Add" {
            var newDestination = segue.destinationViewController as DetailViewController; allArray[0].append(Person(fName: "", lName: ""))
            newDestination.DTPersonProfile = allArray[0][allArray[0].count-1]
        }
        
        
        }
    }



