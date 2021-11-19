//
//  AccumulationTableViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 16.11.2021.
//

import UIKit

class AccumulationTableViewController: UITableViewController {
    
     var accumulation = Accumulation.getData()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return accumulation.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accumulation", for: indexPath)
        let newAccumulation = accumulation[indexPath.section]
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
            content.text = "Полная сумма: \(newAccumulation.totalAmount)"
         content.secondaryText = "Валюта: \(newAccumulation.exchange)"

        } else {
            
            content.text = "Уже внесено:\(newAccumulation.currentAmount)"
            content.secondaryText = "Продолжительность: \(newAccumulation.duration) месяцев"
            
        }
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
        return accumulation[section].name
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newAccVC = segue.destination as? NewAccumulationViewController else { return }
        newAccVC.newAccumulation = accumulation
    }
   
     func unwind(for unwindSegue: UIStoryboardSegue) {
         guard let newAccVC = unwindSegue.source as? NewAccumulationViewController else { return }
         accumulation = newAccVC.saveNewAccumulation()
         tableView.reloadData()
    }

}
