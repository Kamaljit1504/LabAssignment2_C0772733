//
//  NotesTableViewController.swift
//  LabAssignment2_C0772733
//
//  Created by MacStudent on 2020-01-21.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class TaskTableVC: UITableViewController {
    
    var tasks : [Task]?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadCoreData()
    }

    
    func  loadCoreData()
    {
        tasks = [Task]()
        
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let managedContext = appDelegate.persistentContainer.viewContext
         
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasksmodel")
        do
        {
            let results = try managedContext.fetch(fetchRequest)
             if results is [NSManagedObject]{
                           for result in (results as! [NSManagedObject])
                           {
                           
                           }
                       }
                   } catch  {
                       print(error)
                   }
            
        }
        
    override func viewWillAppear(_ animated: Bool) {
        self.loadCoreData()
        tableView.reloadData()
        
        
    }
        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks?.count ?? 0
    }
    
    func deleteCoreData(index: Int) {
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let managedContext = appDelegate.persistentContainer.viewContext
                let requestDel = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasksmodel")
                requestDel.returnsObjectsAsFaults = false
                do {
                    let arr = try managedContext.fetch(requestDel)
                    let obj = arr as! [NSManagedObject]
                    managedContext.delete(obj[index])
                } catch  {
                    print(error)
                }
                do {
                    try managedContext.save()
                   
                } catch  {
                    print(error)
                }

            }
}
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

                  
                  if let controller = segue.destination as? ModifyVC
                          {
                              let contactIndexPath = self.tableView.indexPath(for: (sender as! UITableViewCell))!
                            //  let object = contacts![contactIndexPath.row]
                             // controller.setIndex(index: contactIndexPath.row ,data: object.phonenumber)
                              
                          
                      }
                  
              }

/*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let task = tasks![indexPath.row]
        let cell  = tableView.dequeueReusableCell(withIdentifier: "taskTable")
        //cell?.textLabel?.text = task.tasks
       // cell?.detailTextLabel?.text = "\(task.days) days needed"
        
        if task.days == 0{
            cell?.contentView.backgroundColor = .cyan
            cell?.detailTextLabel?.text = "Completed👍🏻"
            
        }
        else{
            cell?.contentView.backgroundColor = .gray
        }
        
        
        cell?.textLabel?.textColor = .white

        
        
        // Configure the cell...

        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {
            (action, view, success) in self.tasks?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
    })
        
        let AddDayAction = UIContextualAction(style: .normal, title: "Add a Day") {
            (action , view, success) in
            
            self.tasks![indexPath.row].days -= 1
            self.tableView.reloadData()
            
            
        }
        AddDayAction.backgroundColor = .black
    return UISwipeActionsConfiguration(actions: [deleteAction , AddDayAction])
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {
                   (action, view, success) in self.tasks?.remove(at: indexPath.row)
                   tableView.deleteRows(at: [indexPath], with: .fade)
                   
           })
               
               let AddDayAction = UIContextualAction(style: .normal, title: "Add a Day") {
                   (action , view, success) in
                   self.tasks![indexPath.row].days -= 1
                self.tableView.reloadData()
               }
               AddDayAction.backgroundColor = .black
           return UISwipeActionsConfiguration(actions: [deleteAction , AddDayAction])
               
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let move = self.tasks![sourceIndexPath.row]
        tasks!.remove(at: sourceIndexPath.row)
        tasks!.insert(move, at: destinationIndexPath.row)
    }
    
    
    @IBAction func SortTasks(_ sender: Any) {

      tasks = []
        
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                       
let context = appDelegate.persistentContainer.viewContext
                
        
    let fetchRqst = NSFetchRequest<NSFetchRequestResult>(entityName: "TasksModel")
        
        fetchRqst.sortDescriptors = [NSSortDescriptor(key: "task", ascending: true)]
        
do{
      let results = try context.fetch(fetchRqst)
        if results is [NSManagedObject]{
            
            for result  in results as! [NSManagedObject]{
                
    let task = result.value(forKey: "task") as! String
                
    let days = result.value(forKey: "days") as! Int
                
                let date = result.value(forKey: "date") as! Date
                
                let desc = result.value(forKey: "desc") as! String
                
                tasks?.append(Task(tasks: task, days: days, date: date , desc: desc))
                tableView.reloadData()
                
                
            }
        }
        
        
}catch{
    print(error)
        }
    
    
    }
    
    
  */
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 }*/
