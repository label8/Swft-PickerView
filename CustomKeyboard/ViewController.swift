//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by Hachiya Tsunemasa on 2017/07/24.
//  Copyright © 2017年 Hachiya Tsunemasa. All rights reserved.
//

import UIKit

class ViewController: CustomPickerViewController, UITextFieldDelegate {
    
    @IBOutlet weak var sampleTextFileld: UITextField!
    @IBOutlet weak var testTextField: UITextField!
    
    var arr1 = ["ほげ", "fuga", "ふー", "bar"]
    var arr2 = ["ほんじつは", "晴天", "なーりー", "！！！"]
    
    var sampleStr: String = ""
    var testStr: String = ""
    var activeTextField: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleTextFileld.delegate = self
        testTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField.tag

        if activeTextField == 1 {
            super.textArray = arr1
            sampleTextFileld.inputView = pickerView
            sampleTextFileld.inputAccessoryView = toolbar
        } else {
            super.textArray = arr2
            testTextField.inputView = pickerView
            testTextField.inputAccessoryView = toolbar
        }
    }

    override func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.sampleTextFileld.text = textArray[row]
        if activeTextField == 1 {
            sampleStr = textArray[row]
        } else {
            testStr = textArray[row]
        }
    }
    
    override func cancel() {
        if activeTextField == 1 {
            self.sampleTextFileld.endEditing(true)
        } else {
            self.testTextField.endEditing(true)
        }
        
    }
    
    override func done() {
        if activeTextField == 1 {
            self.sampleTextFileld.text = sampleStr
            self.sampleTextFileld.endEditing(true)
        } else {
            self.testTextField.text = testStr
            self.testTextField.endEditing(true)
        }
    }
    
}

