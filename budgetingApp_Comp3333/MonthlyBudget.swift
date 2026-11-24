//
//  MonthlyBudget.swift
//  budgetingApp_Comp3333
//
//  Created by Kiera Holland on 11/24/26.
//

import UIKit

class MonthlyBudget: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var budgetInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        budgetInput.delegate = self
    }
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    //Display alert from past assignments
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func saveBudget(_ sender: Any) {
        //Hide the keyboard
        budgetInput.resignFirstResponder()
        
        //Check that budget is valid before allowing user to save
        if let newBudget = Float(budgetInput.text!){
            if newBudget <= 0{
                displayAlert(msgTitle: "Error", msgContent: "Please enter in a valid budget amount! The budget must be a number greater than 0.")
                return
            }
            //Update budget and give user confirmation
            budget = newBudget
            budgetInput.text = ""

            displayAlert(msgTitle: "Budget Updated Successfully!", msgContent: "Your monthly budget has been updated.")
        }
        else{
            displayAlert(msgTitle: "Error Detected", msgContent: "Please enter a valid number (ex: 800).")
        }
    }
    
}
