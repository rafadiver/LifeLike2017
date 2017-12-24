//
//  Restorante.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/7/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Restorante : NSManagedObject {
    
    @NSManaged var name : String?
    @NSManaged var image : NSData?
    @NSManaged var tipo : String?
    @NSManaged var ciudad : String?
    @NSManaged var location : String?
    @NSManaged var telefono : String?
    @NSManaged var webpage : String?
    
    
//    init(name: String, image: UIImage, tipo: String, ciudad: String, location: String, telefono: String, webpage: String) {
//        self.name = name
//        self.image = image
//        self.tipo = tipo
//        self.ciudad = ciudad
//        self.location = location
//        self.telefono = telefono
//        self.webpage = webpage
//        
//    }
//    
    
}
