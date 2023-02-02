//
//  ViewController.swift
//  calculator
//
//  Created by Hà Quang Hưng on 12/01/2023.
//

import UIKit

class ViewController: UIViewController {

    
    //outlet
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    
    private var inputString = ""
    private let calculation = Calculation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func appendAndUpdateTextFieldInput(character: String) {
        inputString.append(character)
        textFieldInput.text = inputString
    }
    
    private func deleteInputStringAndUpdateTextFieldInput() {
        inputString = ""
        textFieldInput.text = inputString
    }
    
    //button action
    @IBAction func cButton(_ sender: Any) {
        deleteInputStringAndUpdateTextFieldInput()
        labelResult.text = ""
    }
    
    
    @IBAction func percentButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "/100")
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        inputString = String(inputString.dropLast())
        textFieldInput.text = inputString
    }
    
    @IBAction func plusButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "+")
    }
    
    
    @IBAction func sevenButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "7")
    }
    
    @IBAction func eight(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "9")
    }
    
    
    @IBAction func minusButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "-")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "6")
    }
    
    
    @IBAction func multiplyButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "x")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "1")
    }
    
    
    @IBAction func twoButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "2")
    }
    
    
    @IBAction func threeButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "3")
    }
    
    @IBAction func divisionButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "/")
    }
    
    
    @IBAction func zeroButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: "0")
    }
    
    @IBAction func dotButton(_ sender: Any) {
        appendAndUpdateTextFieldInput(character: ".")
    }
    
    
    @IBAction func resultButton(_ sender: Any) {
        labelResult.text = calculation.result(textInput: inputString)
        if calculation.isError() {
            // Create new Alert
            let dialogMessage = UIAlertController(title: "Wrong", message: "Input string is wrong?", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
}

