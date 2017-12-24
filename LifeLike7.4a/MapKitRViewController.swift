//
//  MapKitRViewController.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/9/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapKitRViewController: UIViewController {
    
    var restorate : Restorante!
    
    @IBOutlet weak var mapKit: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapKit.delegate = self
        
        self.mapKit.showsTraffic = true
        self.mapKit.showsScale = true
        self.mapKit.showsCompass = true
        
        print("el mapa debe mostrar" + restorate.name!)
        
        // Do any additional setup after loading the view.
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restorate.location!) { [unowned self] (placemarks, error) in
            
            if error == nil {
                for placemark in placemarks! {
                    print (placemark)
                    
                    let annotation = MKPointAnnotation()
                    annotation.title = self.restorate.name
                    annotation.subtitle = self.restorate.tipo
                    annotation.coordinate = (placemark.location?.coordinate)!
                    
                    self.mapKit.showAnnotations([annotation], animated: true)
                    
                    self.mapKit.selectAnnotation(annotation, animated: true)
                    //
                }
                //                }
                //
            } else {
                print("ha habido un error en mapas")
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



extension MapKitRViewController : MKMapViewDelegate {
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        let identifier = "MyPin"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        var anotationView : MKPinAnnotationView? = self.mapKit.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if anotationView == nil {
            anotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            anotationView?.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
        //imageView.image = self.restorate.image
        imageView.image = UIImage(data: self.restorate.image! as Data)
        //(data: self.place.image! as Data)
        anotationView?.leftCalloutAccessoryView = imageView
        anotationView?.pinTintColor = UIColor.blue
        
        return anotationView
    }
    
}

