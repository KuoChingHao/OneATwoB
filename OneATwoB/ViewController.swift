//
//  ViewController.swift
//  OneATwoB
//
//  Created by 郭景豪 on 2018/10/6.
//  Copyright © 2018 Tank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayEnterNumberTextField: UITextField!
    
    @IBOutlet weak var displayResultLabel: UILabel!
    
    var resultString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultString = createResultNumberString()
        
    }

    
    @IBAction func numberBtnAction(_ sender: Any) {
        
        guard let currentContentText = displayEnterNumberTextField.text else { return }
        
        let numberString = (sender as! UIButton).titleLabel?.text
        
        displayEnterNumberTextField.text = enterNumber(currentContentText: currentContentText, enter: numberString!)
        
    }
    
    
    @IBAction func confirmBtnAction(_ sender: Any) {
        
        
        guard let userEnterNumberString = displayEnterNumberTextField.text , userEnterNumberString.count == 4 else {
            return
        }
        
        
         displayResultLabel.text = checkResult(userEnterNumberString: userEnterNumberString, resultNumberString: resultString)
        
    }
    func checkResult(userEnterNumberString : String , resultNumberString : String) -> String{
        
        
        
        var bResult = 0
        var aResult = 0
        
        for (userIndex,userItem) in userEnterNumberString.enumerated() {

            if resultNumberString.contains(userItem) {
                bResult += 1
                
                for (resultIndex,resultItem) in resultNumberString.enumerated(){
                    if userIndex == resultIndex && userItem == resultItem {
                        aResult += 1
                        bResult -= 1
                    }
                }
            }
        }
        
        var resultString = ""
        
        if aResult > 0 {
            resultString = "\(aResult)A"
        }
    
        if bResult >= 0 && aResult != 4 {
            resultString += "\(bResult)B"
        }
        
        return resultString
    }
    
    
    
    
    func enterNumber(currentContentText : String ,enter : String) -> String{
        var result = currentContentText

        if currentContentText.contains(enter) == false && currentContentText.count < 4 {
            result += enter
        }
        
        return result
    }
    
    
    
    func createResultNumberString() -> String{
        
        var numberArray = [Int]()
        
        for _ in 1...4 {
            
            var random = arc4random() % 10
            
            while numberArray.contains(Int(random)) {
                random = arc4random() % 10
            }
            
            numberArray.append(Int(random))
            
        }
        
        var resultString = ""
        
        numberArray.forEach { (i) in
            resultString += String(i)
        }
        return resultString
    }
}

