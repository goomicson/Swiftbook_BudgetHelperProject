//
//  HistoryTableViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 20.11.2021.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    private var history = Action.getData()
    var newHistory: [Action]!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            history += newHistory
        }
        
        func sorted(for: [Action]) -> [Action]{
            var sorted: [Action] = []
            for item in history {
                if item.startDate <= Date() {
                    sorted.append(item)
                }
                
            }
            return sorted
        }
        
        override   func numberOfSections(in tableView: UITableView) -> Int {
            1
        }
        
        override   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sorted(for: history).count
            
        }
        
        override    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath)
            let nameHistory = sorted(for: history)[indexPath.row]
            var content = cell.defaultContentConfiguration()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            content.text = "Сумма \(nameHistory.amount)"
            content.secondaryText = "Дата операции: \(dateFormatter.string(from: nameHistory.startDate))"
            
            if nameHistory.direction {
                cell.backgroundColor = UIColor.green
                
            } else {
                cell.backgroundColor = UIColor.red
            }
            
            cell.contentConfiguration = content
            return cell
        }
        
        override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let newVC = segue.destination as? NewActionViewController else { return }
            newVC.newHistory = history
        }
        
        @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
            guard let newVC =  unwindSegue.source as? NewActionViewController else {return}
            newHistory = newVC.saveAction()
             tableView.reloadData()
            
        }
        
    }

