//
//  MembersTableViewController.swift
//  HarryPotter-C
//
//  Created by Jordan Bryant on 10/1/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import UIKit

class MembersTableViewController: UITableViewController {
    
    var house: House?
    
    var members: [Member] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(house?.name ?? "") Members"
        
        fetchMembers()
    }
    
    private func fetchMembers() {
        guard let house = house else { return }
        
        let dispatchGroup = DispatchGroup()
        var members: [Member] = []
        
        for memberId in house.members {
            dispatchGroup.enter()
            
            MemberController.fetchMember(withID: memberId) { (member) in
                if let member = member {
                    members.append(member)
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.members = members
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCellId")!
        let member = members[indexPath.row]
        
        cell.textLabel?.text = member.name
        cell.detailTextLabel?.text = "Role: \(member.role?.capitalized ?? "N/A")"
        
        return cell
    }
}
