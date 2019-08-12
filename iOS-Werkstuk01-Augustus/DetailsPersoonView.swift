//
//  DetailsPersoonView.swift
//  iOS-Werkstuk01-Augustus
//
//  Created by Mohamed Helalouch on 12/08/2019.
//  Copyright © 2019 Imane Helalouch. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailsPersoonView: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var persoon = Persoon()
    
    
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblStreetName: UILabel!
    @IBOutlet weak var lblHouseNumber: UILabel!
    @IBOutlet weak var lblPostcode: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    let location = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblFirstName.text = persoon.firstName.capitalized
        self.lblLastName.text = persoon.lastName.capitalized
        self.lblStreetName.text = persoon.streetName.capitalized
        self.lblHouseNumber.text = persoon.streetNumber.capitalized
        self.lblPostcode.text = persoon.postcode.capitalized
        self.lblCity.text = persoon.city.capitalized
        self.img.image = UIImage(named: persoon.image)
        
        let persoonLoc = MKPointAnnotation()
        persoonLoc.coordinate = CLLocationCoordinate2D(latitude: persoon.coordinaat1, longitude: persoon.coordinaat2)
        persoonLoc.title = persoon.streetNumber.capitalized
        persoonLoc.subtitle = persoon.postcode.capitalized
        
        self.mapView.addAnnotation(persoonLoc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ImageViewController{
            vc.temp= self.img.image
        }
    }
    
}
