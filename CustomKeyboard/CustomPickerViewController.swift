//
//  CustomPickerViewController.swift
//  CustomKeyboard
//
//  Created by Hachiya Tsunemasa on 2017/07/24.
//  Copyright © 2017年 Hachiya Tsunemasa. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController {
    
    var pickerView: UIPickerView = UIPickerView()
    var toolbar: UIToolbar!
    
    //var textArray = ["hoge", "fuga", "foo", "bar"]
    var textArray: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CustomPickerViewController.done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CustomPickerViewController.cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }

}

extension CustomPickerViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return textArray.count
    }
    
}

extension CustomPickerViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return textArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }

}

extension CustomPickerViewController {

    func cancel() {}
    func done() {}

}
