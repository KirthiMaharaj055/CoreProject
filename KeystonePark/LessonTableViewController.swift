//
//  LessonTableViewController.swift
//  KeystonePark
//
//  Created by Kirthi Maharaj on 2021/08/12.
//

import UIKit
import CoreData

class LessonTableViewController: UITableViewController {
    
    //Mark: Public Prperties
    
    var moc: NSManagedObjectContext? {
        didSet{
            if let moc = moc {
                lessonService = LessonService(moc: moc)
            }
        }
    }
    // MARK - Private Properties
    private var lessonService: LessonService?
    private var studentList = [Student]()
    
    @IBAction func addStudentAction(_ sender: UIBarButtonItem) {
        present(alertController(actionType: "add"), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStudents()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = studentList[indexPath.row].name
        cell.detailTextLabel?.text = studentList[indexPath.row].lesson?.type
        return cell
    }
    

   // Mark: - Private
    private func alertController(actionType: String) -> UIAlertController{
        let alertController = UIAlertController(title: "Keystone Park Lesson", message: "Student Infp", preferredStyle: .alert)
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Lesson Type | Snowboard"
        }
        
        let defaultAction = UIAlertAction(title: actionType.uppercased(), style: .default) { [weak self] (action) in
            guard let studentName = alertController.textFields?[0].text, let lesson = alertController.textFields?[1].text else {return}
            if actionType.caseInsensitiveCompare("add") == .orderedSame{
                if let lessonType = LessonType(rawValue: lesson.lowercased()){
                    self?.lessonService?.addStudent(name: studentName, for: lessonType, completion: { (success, students) in
                        if success {
                            self?.studentList = students
                        }
                    })
                }
            }
            
            DispatchQueue.main.async {
                self?.loadStudents()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        alertController.addAction(defaultAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }
    
    private func loadStudents(){
        if let students = lessonService?.getAllStudents(){
            studentList = students
            tableView.reloadData()
        }
    }

}
