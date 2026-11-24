//
//  AddNewExpense.swift
//  budgetingApp_Comp3333
//
//  Created by Kiera Holland on 11/24/26.
//

import UIKit

class AddNewExpense: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var booksButton: UIButton!
    @IBOutlet weak var funButton: UIButton!
    @IBOutlet weak var transportationButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    
    //To hold the category that the user selects for their purchase (leave empty initially)
    var selectedCategory = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountInput.delegate = self
        descriptionInput.delegate = self
        resetButtons()

        
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
    
    //Changes all buttons to gray so none are shown as selected
    func resetButtons(){
        foodButton.backgroundColor = .darkGray
        booksButton.backgroundColor = .darkGray
        funButton.backgroundColor = .darkGray
        transportationButton.backgroundColor = .darkGray
        otherButton.backgroundColor = .darkGray
    }
    
    @IBAction func foodTapped(_ sender: Any) {
        resetButtons()
        foodButton.backgroundColor = .init(red: 0.243, green: 0.533, blue: 0.451, alpha: 1)
        selectedCategory = "Food"
    }
    @IBAction func booksTapped(_ sender: Any) {
        resetButtons()
        booksButton.backgroundColor = .init(red: 0, green: 0.533, blue: 1.00, alpha: 1)
        selectedCategory = "Books"
    }
    
    @IBAction func funTapped(_ sender: Any) {
        resetButtons()
        funButton.backgroundColor = .init(red: 0, green: 0.784, blue: 0.702, alpha: 1)
        selectedCategory = "Fun"
    }
    
    @IBAction func transportationTapped(_ sender: Any) {
        resetButtons()
        transportationButton.backgroundColor = .init(red: 0.204, green: 0.780, blue: 0.349, alpha: 1)
        selectedCategory = "Transportation"
    }
    @IBAction func otherTapped(_ sender: Any) {
        resetButtons()
        otherButton.backgroundColor = .init(red: 0, green: 0.765, blue: 0.816, alpha: 1)
        selectedCategory = "Other"
    }
    @IBAction func saveExpense(_ sender: Any) {
        //Hide keyboard
        amountInput.resignFirstResponder()
        descriptionInput.resignFirstResponder()
        
        //Make sure text fields aren't empty before allowing user to save expense
        if amountInput.text == "" || descriptionInput.text == ""{
            displayAlert(msgTitle: "Error Detected!", msgContent: "Please make sure that both the amount and description fields are filled out.")
            return
        }
        
        //Make sure a category is selected
        if selectedCategory == "" {
            displayAlert(msgTitle: "Error Detected!", msgContent: "Please choose a category!")
            return
        }
        
        //Check that amount is valid
        if let amount = Float(amountInput.text!){
            if amount <= 0{
                displayAlert(msgTitle: "Error Detected!", msgContent: "Please enter in a valid amount! The amount must be a number greater than 0.")
                return
            }
            //Add the purchases to the dictionaries
            purchaseNames.append(descriptionInput.text!)
            purchaseAmounts.append(amount)
            purchaseCategories.append(selectedCategory)
            
            //Reset the fields and buttons
            amountInput.text = ""
            descriptionInput.text = ""
            selectedCategory = ""
            resetButtons()
            
            //Confirm that this purchase was added
            displayAlert(msgTitle: "Purchase Successfully Added!", msgContent: "Your purchase has been added.")
        }
        else{
            displayAlert(msgTitle: "Error Detected!", msgContent: "Please make sure that the number entered is valid!")
        }
        
    }
}
