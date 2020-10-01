//
//  HousesTableViewController.swift
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
    
    var houses: [House] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchHouses()
    }
    
    private func fetchHouses() {
        HouseController.fetchHouses { (houses) in
            guard let houses = houses else { return }
            
            self.houses = houses
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "houseCellId")!
        let house = houses[indexPath.row]
            
        cell.textLabel?.text = house.name
        cell.detailTextLabel?.text = "\(house.members.count) members"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMembersList" {
            guard let memberListVC = segue.destination as? MembersTableViewController else { return }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
            let house = houses[selectedIndexPath.row]
            
            memberListVC.house = house
        }
    }
}
