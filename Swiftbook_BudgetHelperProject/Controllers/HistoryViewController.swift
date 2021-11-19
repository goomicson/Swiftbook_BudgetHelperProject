//
//  HistoryViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 16.11.2021.
//

import UIKit

class HistoryViewController: UIViewController {
    
    private var history = Action.getData()

    override func viewDidLoad() {
        super.viewDidLoad()

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
}


extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {

func numberOfSections(in tableView: UITableView) -> Int {
   1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sorted(for: history).count
    
}


func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newVC = segue.destination as? NewActionViewController else { return }
        newVC.newHistory = history
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let newVC =  unwindSegue.source as? NewActionViewController else {return}
        history = newVC.saveAction()
        tableView.reloadData()
        
        }

}
