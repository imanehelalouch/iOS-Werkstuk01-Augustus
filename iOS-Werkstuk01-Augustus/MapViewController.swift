//
//  MapViewController.swift
//  iOS-Werkstuk01-Augustus
//
//  Created by Mohamed Helalouch on 12/08/2019.
//  Copyright © 2019 Imane Helalouch. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var personen = [Persoon]()
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persoon1 = Persoon(firstName: "Catherine", lastName: "Helalouch", image: "sijjd", streetName: "straat", streetNumber: "nummer", postcode: "1020", city: "Brussels", phoneNumber: "0192882", coordinaat1:51.009737, coordinaat2:5.121142)
        personen.append(persoon1)
        let persoon2 = Persoon(firstName: "James", lastName: "Helalouch", image: "sijjd", streetName: "straat", streetNumber: "nummer", postcode: "1020", city: "Brussels", phoneNumber: "0192882", coordinaat1:50.092442, coordinaat2:4.477733)
        personen.append(persoon2)
        
        annotations()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func annotations() {
        for persoon in personen {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: persoon.coordinaat1, longitude: persoon.coordinaat2)
            annotation.title = persoon.streetNumber.capitalized
            
            self.mapView.addAnnotation(annotation)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
    }
}
