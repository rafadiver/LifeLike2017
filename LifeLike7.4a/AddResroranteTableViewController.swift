//
//  AddResroranteTableViewController.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/12/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit
import CoreData

class AddResroranteTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    var item : Restorante? = nil
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldCiudad: UITextField!
    
    @IBOutlet weak var textFieldTipo: UITextField!
    
    @IBOutlet weak var textFieldTelefono: UITextField!
    
    
    @IBOutlet weak var textFieldWebpage: UITextField!
    
    @IBOutlet weak var textFieldDireccion: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var restorante: Restorante?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        
        self.textFieldName.delegate = self
        self.textFieldCiudad.delegate = self
        self.textFieldTipo.delegate = self
        self.textFieldTelefono.delegate = self
        self.textFieldWebpage.delegate = self
        self.textFieldDireccion.delegate = self

        
        if item == nil {
            
            self.navigationItem.title = "add new data"
            
        } else {
             self.navigationItem.title = item?.name
            textFieldName.text = item?.name
            textFieldCiudad.text = item?.ciudad
            textFieldTipo.text = item?.tipo
            textFieldTelefono.text = item?.telefono
            textFieldDireccion.text = item?.location
            textFieldWebpage.text = item?.webpage
            
            imageView.image = UIImage(data: (item?.image)! as Data)
            
        
            
        }
        
        
    }

    @IBAction func savePressed(_ sender: UIBarButtonItem) {
    
     
        
            
            let name = self.textFieldName.text!
            let tipo = self.textFieldTipo.text!
            let direccion = self.textFieldDireccion.text!
            let telefono = self.textFieldTelefono.text!
            let web  = self.textFieldWebpage.text!
            let ciudad = self.textFieldCiudad.text!
            let theImage = self.imageView.image!
            
            
            
            if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
                let context = container.viewContext
             
            if item == nil {
            
                self.restorante = NSEntityDescription.insertNewObject(forEntityName: "Restorante", into: context) as? Restorante
                
                
                self.restorante?.name = name
                self.restorante?.tipo = tipo
                self.restorante?.location = direccion
                self.restorante?.telefono = telefono
                self.restorante?.webpage = web
                self.restorante?.ciudad = ciudad
                
                self.restorante?.image = UIImagePNGRepresentation(theImage) as NSData?
            
            
        } else {
            
            
        item?.name = self.textFieldName.text
        item?.tipo = self.textFieldTipo.text!
        item?.ciudad = self.textFieldCiudad.text!
        item?.location =  self.textFieldDireccion.text!
        item?.telefono = self.textFieldTelefono.text!
        item?.webpage = self.textFieldWebpage.text!
        item?.image = UIImagePNGRepresentation(imageView.image!) as NSData?
            
        }
            
    
            
            
            do {
                try context.save()
                
            } catch {
                
                print("ha ocurrido un error")
            }
            
            
            
        }
        
        
//        self.restorante = Restorante(name: name, image: theImage, tipo: tipo, ciudad: ciudad, location: direccion, telefono: telefono, webpage: web)

        
    
        //self.place.rating = rating
        //print(self.restorante!.name)
        
        
        /*
         if let container = UIApplication.shared() as? AppDelegate)?.persistentContainer {
         let context = container.viewContext
         self.place = NSEntityDescription.insertNewObject(forEntityName: "Place", into: context) as? Place
         
         }
         */
        
        
        
        
        
        self.performSegue(withIdentifier: "unwindToMainViewController", sender: self)
        

    
    
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                
                
                self.present(imagePicker, animated:true, completion: nil)
            }
            
            
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.clipsToBounds = true
        
        let leadingConstrain = NSLayoutConstraint(item: self.imageView, attribute: .leading, relatedBy: .equal, toItem: self.imageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstrain.isActive = true
        
        let trailingConstrain = NSLayoutConstraint(item: self.imageView, attribute: .trailing, relatedBy: .equal, toItem: self.imageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstrain.isActive = true
        
        
        let topConstrain = NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self.imageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstrain.isActive = true
        
        
        let bottomConstrain = NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .equal, toItem: self.imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstrain.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    

    

}
