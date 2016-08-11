//
//  TokenPaymentViewController.swift
//  Stripe-Demo
//
//  Created by S.t on 16/8/11.
//  Copyright © 2016年 S.t. All rights reserved.
//

import UIKit

class TokenPaymentViewController: UITableViewController , STPPaymentCardTextFieldDelegate {

    @IBOutlet weak var saveSwitch: UISwitch!
    @IBOutlet weak var paymentFieldCell: UITableViewCell!
    let paymentField = STPPaymentCardTextField()
    
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        
        self.activityIndicator.activityIndicatorViewStyle = .Gray
        self.activityIndicator.hidesWhenStopped = true
        self.view.addSubview(self.activityIndicator)
        
        paymentField.delegate = self
        paymentField.cursorColor = UIColor.purpleColor()
        paymentField.frame = CGRectMake(15, 0, CGRectGetWidth(self.view.frame) - (15 * 2) , 44)
        
        //NSLog(paymentFieldCell.contentView.bounds, nil)
        
        paymentFieldCell.addSubview(paymentField)
    }
    
    @IBAction func paymentDone(sender: AnyObject) {
        if !self.paymentField.isValid{
            return
        }
        
        // user authenticate to save the card, then ask backend server 
        // to create customer id and use customer id to charge.
        if saveSwitch.on{
        
        }
        else{
            self.activityIndicator.startAnimating()
            STPAPIClient.sharedClient().createTokenWithCard(self.paymentField.cardParams, completion: { (token:STPToken?, error:NSError?) -> Void in
                self.activityIndicator.stopAnimating()
                if token == nil{
                    return
                }else{
                    NSLog((token?.tokenId)!)
                    // charge with token 
                    let url = "https://calm-refuge-54946.herokuapp.com/charge"
                    let params = [
                        "stripeToken" : token!.tokenId,
                        "amount" : "100"
                    ]
                    StripeService.sharedInstance.postMethod(url, params: params, completion: { (result:AnyObject?, error:NSError?) -> Void in
                        if result != nil{
                            print(result)
                        }
                        
                        if error != nil{
                            print(result)
                        }
                        
                    })
                }
                
                
            })
            
        }
        
        
    }
    
}
