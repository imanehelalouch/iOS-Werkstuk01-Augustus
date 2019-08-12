//
//  TableViewController.swift
//  iOS-Werkstuk01-Augustus
//
//  Created by Mohamed Helalouch on 12/08/2019.
//  Copyright © 2019 Imane Helalouch. All rights reserved.
//


import UIKit

class TableViewController: UITableViewController {
    
    var personen = [Persoon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persoon1 = Persoon(firstName: "T##String", lastName: "T##String", image: "T##String", streetName: "T##String", streetNumber: "T##String", postcode: "T##String", city: "T##String", phoneNumber: "T##String", coordinaat1: 12, coordinaat2: 32)
        personen.append(persoon1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = personen[indexPath.row].firstName.capitalized
        cell.detailTextLabel?.text = personen[indexPath.row].lastName.capitalized
        cell.imageView?.image = UIImage(named: personen[indexPath.row].image)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let vc = segue.destination as! DetailsPersoonView
            let indexPath = self.tableView.indexPathForSelectedRow
            vc.persoon = personen[(indexPath?.row)!]
        }
        
    }
}
