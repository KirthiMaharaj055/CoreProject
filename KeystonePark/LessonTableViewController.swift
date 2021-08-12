//
//  LessonTableViewController.swift
//  KeystonePark
//
//  Created by Kirthi Maharaj on 2021/08/12.
//

import UIKit

class LessonTableViewController: UITableViewController {

    @IBAction func addStudentAction(_ sender: UIBarButtonItem) {
        present(alertController(actionType: "add"), animated: true, completion: nil)
    }
    let student = ["Ben","John"]
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return student.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = student[indexPath.row]
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
        
        let defaultAction = UIAlertAction(title: actionType.uppercased(), style: .default) { (action) in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        alertController.addAction(defaultAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }

}
