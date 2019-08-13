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
        
        let persoon1 = Persoon(firstName: "Catherine", lastName: "Marge", image: "profilepic", streetName: "Karel Bogaert", streetNumber: "23", postcode: "1020", city: "Laken", phoneNumber: "023438292", coordinaat1:50.092442, coordinaat2:4.477733)
        personen.append(persoon1)
        
        let persoon2 = Persoon(firstName: "James", lastName: "Homer", image: "profilepic", streetName: "Marie Christine straat", streetNumber: "87", postcode: "1080", city: "Anderlecht", phoneNumber: "023829232", coordinaat1:50.009442, coordinaat2:5.477733)
        personen.append(persoon2)
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
        if segue.identifier == "toDetails" {
            let vc = segue.destination as! DetailsPersoonView
            let indexPath = self.tableView.indexPathForSelectedRow
            vc.persoon = personen[(indexPath?.row)!]
        }
        
    }
}
