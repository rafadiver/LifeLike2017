//
//  FirstViewController.swift
//  LifeLike7.4a
//
//  Created by Maria Susana Moline Venanzi on 10/22/17.
//  Copyright © 2017 rafadiver. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    


        @IBOutlet weak var IbPickerChoiceLabel: UILabel!
        @IBOutlet weak var pkrOutlet: UIPickerView!

    
        var pickerDataSource :  [String] =  []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        
        
                self.pkrOutlet.delegate = self
                self.pkrOutlet.dataSource = self
        
    pickerDataSource =  ["Libros", "Restorantes", "Vinos", "Quesos", "Peliculas"]
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerDataSource.count
        }
    
    
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerDataSource [row]
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
            switch row {
            case 0:
                IbPickerChoiceLabel.text = pickerDataSource[0]
            case 1:
                IbPickerChoiceLabel.text = pickerDataSource[1]
            case 2:
                IbPickerChoiceLabel.text = pickerDataSource[2]
            case 3:
                IbPickerChoiceLabel.text = pickerDataSource[3]
            case 4:
                IbPickerChoiceLabel.text = pickerDataSource[4]
            default:
                IbPickerChoiceLabel.text = "Picker View Rafa"
    
            }
        }
    
    
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 60
        }
    
    
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    //
            let toplabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
            toplabel.text = pickerDataSource[row]
            view.addSubview(toplabel)
            toplabel.textColor = UIColor.white
            toplabel.textAlignment = .center
            toplabel.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.light)
           return view
        }
    
    


    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let guest = segue.destination as! TableViewController
        guest.titulo = IbPickerChoiceLabel.text!


        }
    }
    
    

