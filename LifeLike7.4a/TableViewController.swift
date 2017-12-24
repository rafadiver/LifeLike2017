//
//  TableViewController.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/6/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var restorantes : [Restorante] = []
    var searchResults : [Restorante] = []
    var fetchResultsController : NSFetchedResultsController<Restorante>!
    var searchController: UISearchController!
    var titulo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.isNavigationBarHidden = false
        
        self.navigationItem.title = titulo
        
      //  self.navigationItem.title = self.restorante1
        print(titulo)
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Buscar lugare"
        self.searchController.searchBar.tintColor = UIColor.white
        self.searchController.searchBar.barTintColor = UIColor.darkGray
        
        
        let fetchRequest : NSFetchRequest<Restorante> = NSFetchRequest(entityName: "Restorante")
        let sortDescriptor = NSSortDescriptor(key: "ciudad", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            
            
            self.fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            self.fetchResultsController.delegate = self
            
            
            do {
                try fetchResultsController.performFetch()
                self.restorantes = fetchResultsController.fetchedObjects!
            } catch {
                
                print("error al hacer fetch \(error)")
            }
        }
        for restorante in self.restorantes {
            print(restorante.name!)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if self.searchController.isActive {
            return self.searchResults.count
        } else {
           return self.restorantes.count
        }
        
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let restorante : Restorante!
        
        if self.searchController.isActive {
            restorante = self.searchResults [indexPath.row]
        } else {
            restorante = self.restorantes[indexPath.row]
        }
        
        //let Cell = "TableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

       //cell.textLabel?.text = restorante.name
       
        
        cell.cellName.text = restorante.name
       // [indexPath.row]
        cell.celldescription.text = restorante.tipo
            //descriptionList[indexPath.row]
        cell.cellCiudad.text = restorante.ciudad
        cell.cellImageView.image = UIImage(data: restorante.image! as Data)
        cell.cellImageView.layer.cornerRadius = 42.0
        cell.cellImageView.clipsToBounds = true
        cell.accessoryType = .disclosureIndicator

        return cell
    }

//  Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            self.restorantes.remove(at: indexPath.row)
//        }
//
//        self.tableView.deleteRows(at: [indexPath], with: .fade)
//
//    }

    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
       // Compartir

        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexpath) in

//            let restorante : Restorante!
//            if self.searchController.isActive {
//                restorante = self.searhResults [indexPath.row]
//            } else {
//                restorante = self.restorantes[indexPath.row]
//            }

            let sharedefaultext = "Estoy mirando la receta \(self.restorantes [indexPath.row].name!)) de curso"

//            for restorante in self.restorantes {
//                print(restorante.name)
//            let sharedefaultext = restorante.name
//            }

            let activityController = UIActivityViewController(activityItems:  [sharedefaultext, UIImage(data: self.restorantes [indexPath.row].image! as Data)!], applicationActivities: nil)
                                                                          
      
        self.present(activityController, animated: true, completion: nil)

            
        }

        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)

       //Borrar

        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexpath) in


            if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext


            let restoranteToDelete = self.fetchResultsController.object(at: indexPath)
                context.delete(restoranteToDelete)

                do {
                    try context.save()

                } catch {
                    print("error 3 \(error)")

                }

            }


        }



        deleteAction.backgroundColor = UIColor(red: 205.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)

         return [shareAction, deleteAction]
        // return [shareAction]

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "DetailPlace") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
  
      //  let selectedRestorante = self.restorantes[indexPath.row]
                
          
                let restorante : Restorante!
                
                if self.searchController.isActive {
                    restorante = self.searchResults [indexPath.row]
                } else {
                    restorante = self.restorantes[indexPath.row]
                }
                
                
        let destivationViewConroller = segue.destination as! DetailViewController
        destivationViewConroller.restorante = restorante
           
            }
        }
    }
    
    
    
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {
        
        if segue.identifier == "unwindToMainViewController" {
            if let addplaceVC = segue.source as? AddResroranteTableViewController {
               if let newPlace = addplaceVC.restorante {
                    self.restorantes.append(newPlace)
                
                //   self.tableView.reloadData()
                }
            }
        }
        
        
    }
    
    
    func filterContentFor(textToSearch: String) {
        self.searchResults = self.restorantes.filter({ (restorante) -> Bool in
            let nameToFind = restorante.name?.range(of: textToSearch, options: NSString.CompareOptions.caseInsensitive)
             return nameToFind != nil
        })
    }
    
    
    
    
    }
    

extension TableViewController : NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }

    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        
        switch type {
        case .insert:
            
            
            if let newIndexPath = newIndexPath {
                self.tableView.insertRows(at: [newIndexPath], with: .fade)
            }
            
            
            
            
        case .delete:
            
            if let indexPath = indexPath {
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            
            
        case .update:
            
            if let indexPath = indexPath {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
            
        case .move:
            
            if let indexPath = indexPath, let newIndexPath = newIndexPath {
                
                    self.tableView.moveRow(at: indexPath, to: newIndexPath)
            }
                
                
//
//        default:
//            self.tableView.reloadData()
        }
        
        self.restorantes = controller.fetchedObjects as! [Restorante]
        
    }
    
    

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }

}



extension TableViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            self.filterContentFor(textToSearch: searchText)
            self.tableView.reloadData()
        }
    }
}

    

