//
//  ViewController.swift
//  BloomCount
//
//  Created by Andrea Couto on 12/3/16.
//  Copyright © 2016 Andrea Couto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buds: [UITextField]!
    @IBOutlet var flowers: [UITextField]!
    @IBOutlet var fruit: [UITextField]!
        
    @IBOutlet var alltextfields: [UITextField]!
        
    @IBOutlet weak var displayOOB: UILabel!
    @IBOutlet weak var displayIB: UILabel!
        
        
    func getTotal(_ textfields: [UITextField]) -> Double {
        var total = 0.0
        for textf in textfields{
            if textf.text! == "" {
                textf.text = "0.0"
            }
            total += Double(textf.text!)!
        }
        return total
    }
    

    @IBAction func Clear(_ sender: UIButton) {
        for field in alltextfields {
            field.text = ""
        }
        displayOOB.text = ""
        displayIB.text = ""
    }
        
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func OOB(_ sender: UIButton) {
        var fruitsum = 0.0
        for fruitfield in fruit{
            if fruitfield.text! == "" {
                fruitfield.text = "0.0"
            }
            fruitsum += Double(fruitfield.text!)!
        }
        displayOOB.text = String(round((fruitsum/getTotal(alltextfields))*100))
    }
    
    
    @IBAction func INBLOOM(_ sender: UIButton) {
        var sum = 0.0
        for flowerfield in flowers{
            if flowerfield.text! == "" {
                flowerfield.text = "0"
            }
            sum += Double(flowerfield.text!)!
        }
        
        displayIB.text = String(round((sum/getTotal(alltextfields))*100))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for textfield in alltextfields{
            textfield.placeholder = "0"
            textfield.keyboardType = UIKeyboardType.numberPad
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // Has to do with viewcontroller lifycycle
    }

}

