//
//  HomeScreenViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 14.11.2021.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    private let actions = Action.getData()
    
    @IBOutlet var summLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        summLabel.text = "\(Int(user.account))\(user.exchange.rawValue)"
        print (user.account)
    }
    
    func sorted(for: [Action]) -> [Action]{
        var sorted: [Action] = []
        for item in actions {
            if item.frequency != .none && item.startDate >= Date() && item.direction == false {
                sorted.append(item)
            }
        }
        return sorted
    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sorted(for: actions).count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    //Передача данных в кастомную ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "action") as! HomeScreenTableViewCell
        let nameAction = sorted(for: actions)[indexPath.section]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.nameLabel.text = nameAction.name
        cell.dateLabel.text = dateFormatter.string(from: nameAction.startDate)
        cell.sumLable.text = "\(Int(nameAction.amount))"
        return cell
        
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "action", for: indexPath)
        //        let nameAction = sorted(for: actions)[indexPath.section]
        //        var content = cell.defaultContentConfiguration()
        
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateStyle = .short
        //        if  indexPath.row == 0  {
        //            content.text = "\(nameAction.name): \(Int(nameAction.amount))"
        //        } else {
        //            content.text = "Next pay: \(dateFormatter.string(from: nameAction.startDate))"
        //        }
        //        cell.contentConfiguration = content
        
    }
    
}
