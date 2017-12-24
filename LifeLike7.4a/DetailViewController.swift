//
//  DetailViewController.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/6/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit
//import MapKit

class DetailViewController: UIViewController {
    
    //    var sendData1:String!
    //    var sendData2:String!
    //    var sendData3:String!
    //    var sendData4:String!
    var restorante : Restorante!
    
    
    //    var latitud = 0.0
    //    var longitud = 0.0
    

    @IBOutlet weak var detailImageView: UIImageView!
    

    //@IBOutlet weak var detailMapView: MKMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //directionButton.layer.cornerRadius = 5
        //detailMapView.layer.cornerRadius = 5
        
        self.navigationItem.title = self.restorante.name
        
        //self.detailTitle.text = self.restorante.ciudad
        //self.detailTipo.text = self.restorante.tipo
        
        self.detailImageView.image = UIImage(data: self.restorante.image! as Data)
        
        
        //        if detailTitle.text == "Big Ben" {
        //
        //
        //        }
        //
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPhoto" {
            
            let destinationViewController = segue.destination as! ShowPhotoViewController
            destinationViewController.restoranteImageR = UIImage(data: self.restorante.image! as Data)
            
        }
        
        
        if segue.identifier == "showMapR" {
            
            let destinationViewController = segue.destination as! MapKitRViewController
            
            destinationViewController.restorate = self.restorante
            
        }
        
        if segue.identifier == "edit" {
            
         let destinationViewController = segue.destination as! AddResroranteTableViewController
            
            destinationViewController.item = self.restorante
            
        }
        
        
        
        
    }
    
    
    
    
    //
    //    @IBAction func showPhotoAction(_ sender: Any) {
    //
    //        performSegue(withIdentifier: "showPhoto", sender: sender)
    //
    //    }
    
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     //}
 
    
    
    
    
    
    
}



extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRestoranteCell", for: indexPath) as! DetailTableViewCell
        
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "nombre"
            cell.valueLabel.text = self.restorante.name
            
        case 1:
            cell.keyLabel.text = "tipo"
            cell.valueLabel.text = self.restorante.tipo
            
        case 2:
            cell.keyLabel.text = "ciudad"
            cell.valueLabel.text = self.restorante.ciudad
            
            
        case 3:
            cell.keyLabel.text = "direccion"
            cell.valueLabel.text = self.restorante.location
            
        case 4:
            cell.keyLabel.text = "telefono"
            cell.valueLabel.text = self.restorante.telefono
            
        case 5:
            cell.keyLabel.text = "webPage"
            cell.valueLabel.text = self.restorante.webpage
            
            
        default:
            break
        }
        
        return cell
    }
    
    
}


extension DetailViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 3:
            self.performSegue(withIdentifier: "showMapR", sender: nil)
            
        case 4:
            let alertcontroller = UIAlertController(title: "Contactar para reservar con \(self.restorante.name!)", message: "Como quieres contactar con \(self.restorante.telefono!)", preferredStyle: .actionSheet)
            
            let callAction = UIAlertAction(title: "llamar", style: .default, handler: { (action) in
                // llamar
                if let phoneURL = URL(string: "tel://\(self.restorante.telefono!)"){
                    let app = UIApplication.shared
                    if app.canOpenURL(phoneURL) {
                        app.open(phoneURL, options: [:], completionHandler: nil)
                    }
                }
            })
            alertcontroller.addAction(callAction)
            
            //            let smsAction = UIAlertAction(title: "mensaje", style: .default, handler: { (action) in
            //                // sms
            //            })
            //            alertcontroller.addAction(smsAction)
            //
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: { (action) in
                // cancel
            })
            alertcontroller.addAction(cancelAction)
            
            self.present(alertcontroller,animated: true, completion: nil)
            
        case 5:
            // abrir pag web
            if let websiteURL = URL(string: "https://\(self.restorante.webpage!)"){
                let app = UIApplication.shared
                
                if app.canOpenURL(websiteURL) {
                    app.open(websiteURL, options: [:], completionHandler: nil)
                }
                
                
            }
            
            
        default:
            break
        }
        
    }
    
    
    
    
}
