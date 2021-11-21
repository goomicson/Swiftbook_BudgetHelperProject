//
//  SubscribtionTableViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 16.11.2021.
//

import UIKit

class SubscribtionTableViewController: UITableViewController {
    
    private var subscription = Action.getData()
    
    
    func sorted(for: [Action]) -> [Action]{
        var sorted: [Action] = []
        for item in subscription {
            if item.frequency != .none && item.direction == false {
                sorted.append(item)
            }
            
        }
        return sorted
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sorted(for: subscription).count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //Передача данных в кастомную ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscription") as! SubscriptionTableViewCell
        let nameSubscription = sorted(for: subscription)[indexPath.section]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.nameLabel.text = nameSubscription.name
        cell.dateLabel.text = dateFormatter.string(from: nameSubscription.startDate)
        cell.sumLable.text = "\(Int(nameSubscription.amount))"
        return cell
    }
        
//        var content = cell.defaultContentConfiguration()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
//        if  indexPath.row == 0  {
//            content.text = "Сумма подписки: \(nameSubscription.amount)"
//        } else {
//            content.text = "Дата списания: \(dateFormatter.string(from: nameSubscription.startDate))"
//        }
//        cell.contentConfiguration = content
      
//
//    override func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
//        return sorted(for: subscription)[section].name
//
//    }
//
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let newSubVC = segue.destination as? NewSubscriptionViewController else { return }
         newSubVC.newSubscription = subscription
     }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let newSubVC =  unwindSegue.source as? NewSubscriptionViewController else {return}
        subscription = newSubVC.pressdOK()
        tableView.reloadData()
        }
    

}
