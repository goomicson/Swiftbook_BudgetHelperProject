//
//  NewActionViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 20.11.2021.
//

import UIKit

class NewActionViewController: UIViewController {
    
    var newHistory: [Action]! = []
    
    @IBOutlet var directionSegment: UISegmentedControl!
    @IBOutlet var sumTF: UITextField!
    @IBOutlet var dataAction: UIDatePicker!
    @IBOutlet var nameTF: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func deductOrAdd() -> Bool {
        switch directionSegment.selectedSegmentIndex{
        case 0:
            return false
        default:
            return true
        }
    }
    
    func saveAction () -> [Action] {

      let ammount: Double = Double(sumTF.text!) ?? 0.0
        
        newHistory.append(Action(amount: ammount, direction: deductOrAdd(), startDate: dataAction.date, frequency: Action.Frequency.none, name: nameTF.text, endDate: dataAction.date))
        return newHistory
    }

}