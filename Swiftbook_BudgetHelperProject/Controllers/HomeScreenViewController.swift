//
//  HomeScreenViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 14.11.2021.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    private let user = User.getData()
    private let actions = Action.getData()
    
    @IBOutlet var summLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summLabel.text = String(user.account)
        
    }
    func sorted(for: [Action]) -> [Action]{
        var sorted: [Action] = []
        for item in actions {
            if item.frequency != .none && item.startDate >= Date()  && item.direction == false {
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
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "action", for: indexPath)
        //init(style: UITableViewCell.CellStyle, reuseIdentifier: "action")
        let nameAction = sorted(for: actions)[indexPath.section]
        var content = cell.defaultContentConfiguration()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        if  indexPath.row == 0  {
            content.text = "Сумма подписки: \(nameAction.amount)"
        
        } else {
            content.text = "Дата следующего списания: \(dateFormatter.string(from: nameAction.startDate))"
        }
        
        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
        return sorted(for: actions)[section].name
        
    }
    
    
}
