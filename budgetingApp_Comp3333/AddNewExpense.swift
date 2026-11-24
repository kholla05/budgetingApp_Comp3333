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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func foodTapped(_ sender: Any) {
    }
    @IBAction func booksTapped(_ sender: Any) {
    }
    
    @IBAction func funTapped(_ sender: Any) {
    }
    
    @IBAction func transportationTapped(_ sender: Any) {
    }
    @IBAction func otherTapped(_ sender: Any) {
    }
    @IBAction func saveExpense(_ sender: Any) {
    }
}
