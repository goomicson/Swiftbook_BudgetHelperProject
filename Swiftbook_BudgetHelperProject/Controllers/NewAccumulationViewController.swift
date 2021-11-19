//
//  NewAccumulationViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 19.11.2021.
//

import UIKit

class NewAccumulationViewController: UIViewController {
    
    var newAccumulation: [Accumulation]!
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var currencySegment: UISegmentedControl!
    @IBOutlet var accumulationAmountTF: UITextField!
    @IBOutlet var mounthTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = newAccumulation
    }
    
    func currencySelection() -> Accumulation.Exchange{
        var currency: Accumulation.Exchange
        switch currencySegment.selectedSegmentIndex{
        case 0:
            currency = Accumulation.Exchange.euro
        case 1:
            currency = Accumulation.Exchange.dollar
        default:
            currency = Accumulation.Exchange.ruble
        }
        return currency
    }
    
    
    func saveNewAccumulation() -> [Accumulation] {
        let totalAmount:Double = Double(accumulationAmountTF.text ?? "") ?? 0.0
        let mount: Int = Int(mounthTF.text ?? "") ?? 0
        
        newAccumulation.append(Accumulation(name: nameTF.text ?? "", totalAmount: totalAmount, dayOfProfit: Date.now, duration: mount, exchange: currencySelection()))
       
        return newAccumulation
        
    }
    
    
}