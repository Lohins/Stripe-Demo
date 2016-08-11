//
//  ViewController.swift
//  Stripe-Demo
//
//  Created by S.t on 16/8/11.
//  Copyright © 2016年 S.t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customerIDTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test(){
        let customerID = "xunlei"
        let baseURL = "https://calm-refuge-54946.herokuapp.com"
        let path =  "\(baseURL)/customers/\(customerID)"
        
        StripeService.sharedInstance.getMethod(path, params: [:]) { (result: AnyObject?, error: NSError?) -> Void in
            if result != nil{
                print(result)
            }else if error != nil{
                print(error)
            }
            
        }
    }
    
    
    @IBAction func payByStripe(sender: AnyObject) {
        var customerID = customerIDTextField.text
        
        if customerID != nil{
            self.performSegueWithIdentifier("tokenpayment", sender: self)
        }
        else{
            self.performSegueWithIdentifier("tokenpayment", sender: self)
        }
    }
    
}

