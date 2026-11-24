//
//  Dashboard.swift
//  budgetingApp_Comp3333
//
//  Created by Kiera Holland on 11/24/26.
//

import UIKit

//COME BACK AND FINISH

//Global Variables
var budget: Float = 0

var purchaseNames: [String] = []
var purchaseAmounts: [Float] = []
var purchaseCategories: [String] = []


class Dashboard: UIViewController {
    @IBOutlet weak var ltsLabel: UILabel!
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var trackingLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var booksLabel: UILabel!
    @IBOutlet weak var funLabel: UILabel!
    @IBOutlet weak var transportationLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Uodate values on screen
        updateScreen()
    }
    
    func updateScreen() {
        //Initialize values
        var totalSpent: Float = 0
        var foodTotal: Float = 0
        var booksTotal: Float = 0
        var funTotal: Float = 0
        var transportationTotal: Float = 0
        var otherTotal: Float = 0
        
    }
    

}
