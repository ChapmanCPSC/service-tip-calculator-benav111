//
//  ViewController.swift
//  HelloName
//
//  Created by Benavidez, Amanda on 3/7/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate
{

    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var numberPicker: UIPickerView!
    @IBOutlet weak var tipLabel: UILabel!
    
    //initializing array to hold data
    var numberPickerData: [String] = ["1","2","3","4","5", "6","7","8","9", "10"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set numberPicker's delegate an datasource to self
        numberPicker.dataSource = self
        numberPicker.delegate = self
    
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //returns the number of components in the picker view, we have only 1
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    //returns the number of rows for the pickerview based on the number of items in our datasource, numberPickerData array
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return numberPickerData.count
    }
    
    //returns the correct data that corresponds to that particular row
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component:Int) -> String?
    {
        return numberPickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {//based on the row selected calculate the tip with the according service rating
        if row == 0
        {
            self.calculateTip(priceTextField.text!, "1")
        }
        else if row == 1
        {
            self.calculateTip(priceTextField.text!, "2")

        }
        else if row == 2
        {
            self.calculateTip(priceTextField.text!, "3")

        }
        else if row == 3
        {
            self.calculateTip(priceTextField.text!, "4")

        }
        else if row == 4
        {
            self.calculateTip(priceTextField.text!, "5")

        }
        else if row == 5
        {
            self.calculateTip(priceTextField.text!, "6")

        }
        else if row == 6
        {
            self.calculateTip(priceTextField.text!, "7")

        }
        else if row == 7
        {
            self.calculateTip(priceTextField.text!, "8")

        }
        else if row == 8
        {
            self.calculateTip(priceTextField.text!, "9")

        }
        else
        {
            self.calculateTip(priceTextField.text!, "10")

        }
    }
    
    func calculateTip(priceOfBill: String, _ serviceRating:String)
    {
        var billAsDouble: Double
        
        if let billAsDouble = Double(priceOfBill)
        {//checks to see whether the inputted value from text box is actually a double
            //if it is, then calculate the tip
            if serviceRating == "1" || serviceRating == "2" || serviceRating == "3"
            {//if the service is rated in this scope return the appropriate tip amount and round to 2 decimals
                tipLabel.text = String( Double(round(billAsDouble * 0.10 * 100)/100))
            }
            else if serviceRating == "4" || serviceRating == "5"
            {
                tipLabel.text = String( Double(round(billAsDouble * 0.13 * 100)/100))
            }
            else if serviceRating == "6" || serviceRating == "7"
            {
                tipLabel.text = String( Double(round(billAsDouble * 0.15 * 100)/100))
            }
            else if serviceRating == "8" || serviceRating == "9"
            {
                tipLabel.text = String( Double(round(billAsDouble * 0.20 * 100)/100))
            }
            else
            {
                tipLabel.text = String( Double(round(billAsDouble * 0.25 * 100)/100))
            }
        }
        else
        {//if it is not print the following error
            tipLabel.text = "Enter a number"
            
        }
    }
    
    
}
