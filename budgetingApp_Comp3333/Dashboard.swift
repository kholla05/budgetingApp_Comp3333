//
//  Dashboard.swift
//  budgetingApp_Comp3333
//
//  Created by Kiera Holland on 11/24/26.
//

import UIKit

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
        //Update values on screen
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
        
        //Add all costs together
        for i in 0..<purchaseAmounts.count{
            totalSpent += purchaseAmounts[i]
            
            //Switch statement for each category
            switch purchaseCategories[i] {
            case "Food":
                foodTotal += purchaseAmounts[i]
            case "Books":
                booksTotal += purchaseAmounts[i]
            case "Fun":
                funTotal += purchaseAmounts[i]
            case "Transportation":
                transportationTotal += purchaseAmounts[i]
            default:
                otherTotal += purchaseAmounts[i]

            }
        }
        
        let amountLeft = budget - totalSpent
        
        //To track amount and percentage used
        let percentSpent = totalSpent / budget * 100
        
        //Update labels
        ltsLabel.text = String(format:"$%.2f", amountLeft)
        spentLabel.text = String(format:"Spent: $%.2f", totalSpent)
        budgetLabel.text = String(format:"Budget: $%.2f", budget)
        foodLabel.text = String(format:"Food: $%.2f", foodTotal)
        booksLabel.text = String(format:"Books: $%.2f", booksTotal)
        funLabel.text = String(format:"Fun: $%.2f", funTotal)
        transportationLabel.text = String(format:"Transportation: $%.2f", transportationTotal)
        otherLabel.text = String(format:"Other: $%.2f", otherTotal)
        
        //Update text below spent and budget to let user know the status of their spending based on their budget
        //Went over budget
        if amountLeft < 0{
            trackingLabel.text = String(format: "You've gone over budget by $%.2f", -amountLeft)
            trackingLabel.textColor = .red
            ltsLabel.textColor = .red
        }
        //approaching budget in spending
        else if percentSpent >= 75{
            trackingLabel.text = "Warning! You're approaching your budget!"
            trackingLabel.textColor = .yellow
            ltsLabel.textColor = .yellow
        }
        
        //on track for budgeting
        else{
            trackingLabel.text = "You're currently on track with your budget."
            trackingLabel.textColor = .init(red: 0.243, green: 0.533, blue: 0.451, alpha: 1)
            ltsLabel.textColor = .white
            
        }
        
    }
    

}
