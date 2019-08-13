//
//  AddViewController.swift
//  iOS-Werkstuk01-Augustus
//
//  Created by Mohamed Helalouch on 13/08/2019.
//  Copyright © 2019 Imane Helalouch. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class AddViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate  {

    var geocoder = CLGeocoder()
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtStreetName: UITextField!
    @IBOutlet weak var txtHouseNumber: UITextField!
    @IBOutlet weak var txtPostcode: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtStreetName.delegate = self
        txtHouseNumber.delegate = self
        txtPostcode.delegate = self
        txtCity.delegate = self
        txtPhoneNumber.delegate = self
        // Do any additional setup after loading the view.
        
        txtHouseNumber.keyboardType = UIKeyboardType.numberPad
        txtPostcode.keyboardType = UIKeyboardType.numberPad
        txtPhoneNumber.keyboardType = UIKeyboardType.numberPad
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    @IBAction func clickAdd(_ sender: Any) {
        
        let address = txtStreetName.text! + " " + txtHouseNumber.text! + ", " + txtPostcode.text! + " " + txtCity.text!
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) -> Void in
            
            let placemark = placemarks?.first
            
            let lat = (placemark?.location?.coordinate.latitude)!
            let lon = (placemark?.location?.coordinate.longitude)!
            
            self.add(lat: lat, lon: lon)
            
        })
        
    }
    
    func add(lat: Double, lon: Double) -> Void {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let newPersoon = NSEntityDescription.insertNewObject(forEntityName: "Persoon", into: managedContext) as! Persoon
        
        newPersoon.firstName = txtFirstName.text!
        newPersoon.lastName = txtLastName.text!
        newPersoon.streetName = txtStreetName.text!
        newPersoon.streetNumber = txtHouseNumber.text!
        newPersoon.postcode = txtPostcode.text!
        newPersoon.city = txtCity.text!
        newPersoon.phoneNumber = txtPhoneNumber.text!
        newPersoon.coordinaat1 = lat
        newPersoon.coordinaat2 = lon
        
        do{
            try managedContext.save()
        } catch{
            fatalError("Failure tosave context: \(error)")
        }
        
        if(lat != 0 && lon != 0){
            createAlert()
        } else {
            let alert = UIAlertView()
            alert.title = "False Address"
            alert.message = "Correct the address"
            alert.addButton(withTitle: "Done")
            alert.show()
        }
        
        
    }
    
    func createAlert(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 2.0, execute: {
            self.performSegue(withIdentifier:"goToTable",sender: self)
            self.dismiss(animated: false, completion: nil)
        })
    }
    


}
