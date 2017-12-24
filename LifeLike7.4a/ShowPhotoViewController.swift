//
//  ShowPhotoViewController.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/8/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var showPhotoImage: UIImageView!
    
    
    
    var restoranteImageR : UIImage!
    var restorante : Restorante!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showPhotoImage.image = self.restoranteImageR
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 4.0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.showPhotoImage
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
