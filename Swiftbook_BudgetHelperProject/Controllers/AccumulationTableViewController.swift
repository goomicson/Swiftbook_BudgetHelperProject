//
//  AccumulationTableViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 16.11.2021.
//

import UIKit

class AccumulationTableViewController: UITableViewController {
    
    private let accumulation = Accumulation.getData()

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

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
