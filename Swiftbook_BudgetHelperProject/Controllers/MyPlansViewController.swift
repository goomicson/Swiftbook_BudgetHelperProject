//
//  MyPlansViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 14.11.2021.
//

import UIKit

class MyPlansViewController: UIViewController {

    //MARK: accumulationView Outlets
    @IBOutlet var accumulationBackgroundView: UIView!
    @IBOutlet var accumulationTitle: UILabel!
    @IBOutlet var accumulationEditButton: UIButton!
    @IBOutlet var accumulationAmountTitle: UILabel!
    
    @IBOutlet var accumulationProgressBarBackgroundTrack: UIView!
    @IBOutlet var accumulationProgressBarProgressTrack: UIView!
    
    @IBOutlet var subscriptionsBackgroundView: UIView!
    @IBOutlet var subscriptionsButton: UIButton!
    
    @IBOutlet var accumulationsBackgroundView: UIView!
    @IBOutlet var accumulationsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizingCurrentAccumulationView()
        customizingButtonsView()
        
    }

   
}
extension MyPlansViewController {
    func customizingCurrentAccumulationView (){
        accumulationBackgroundView.layer.cornerRadius = 10
        accumulationBackgroundView.layer.shadowColor = CGColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        accumulationBackgroundView.layer.shadowOpacity = 1
        accumulationBackgroundView.layer.shadowOffset = .init(width: 0, height: 7)
        accumulationBackgroundView.layer.shadowRadius = 20
        accumulationProgressBarBackgroundTrack.layer.cornerRadius = 7
        accumulationProgressBarProgressTrack.layer.cornerRadius = 7
    }
}

extension MyPlansViewController {
    func customizingButtonsView() {
        accumulationsBackgroundView.layer.cornerRadius = 10
        accumulationsBackgroundView.layer.shadowColor = CGColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        accumulationsBackgroundView.layer.shadowOpacity = 1
        accumulationsBackgroundView.layer.shadowOffset = .init(width: 0, height: 7)
        accumulationsBackgroundView.layer.shadowRadius = 20
        
        subscriptionsBackgroundView.layer.cornerRadius = 10
        subscriptionsBackgroundView.layer.shadowColor = CGColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        subscriptionsBackgroundView.layer.shadowOpacity = 1
        subscriptionsBackgroundView.layer.shadowOffset = .init(width: 0, height: 7)
        subscriptionsBackgroundView.layer.shadowRadius = 20
    }
}

