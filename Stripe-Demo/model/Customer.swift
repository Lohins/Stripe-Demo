//
//  Customer.swift
//  Stripe-Demo
//
//  Created by S.t on 16/8/11.
//  Copyright © 2016年 S.t. All rights reserved.
//

import Foundation

let BASEURLSTR = "https://calm-refuge-54946.herokuapp.com"

class Customer: NSObject , STPBackendAPIAdapter{
    static let sharedCustomer = Customer()
    
    var baseURLString: String? = nil
    
    var customerID: String? = nil
    
    var defaultSource: STPCard? = nil
    
    var sources: [STPCard] = []
    
    override init() {
        super.init()
    }
    
    @objc func retrieveCustomer(completion: STPCustomerCompletionBlock) {
        
        // get customer info from stripe server
        guard let key = Stripe.defaultPublishableKey() where !key.containsString("#") else{
            let error = NSError(domain: StripeDomain , code: 50, userInfo: [
                NSLocalizedDescriptionKey: "Please set stripe publishable key first"
                ])
            completion(nil, error)
            return
        }
        
        guard self.customerID != nil else{
            let error = NSError(domain: StripeDomain , code: 50, userInfo: [
                NSLocalizedDescriptionKey: "Please set customer ID first"
                ])
            completion(nil, error)
            return
        }
        var baseURLStr: String?
        if baseURLString != nil{
            baseURLStr = baseURLString
        }
        else{
            baseURLStr = BASEURLSTR
        }
        let baseURL = NSURL(string: baseURLStr!)
        let path =  "/customers/\(customerID)"
        let url = baseURL!.URLByAppendingPathComponent(path)
        
        StripeService.sharedInstance.getMethod(url.absoluteString, params: [:]) { (result: AnyObject?, error: NSError?) -> Void in
            if result != nil{
                print(result)
            }else if error != nil{
                print(error)
            }
            
        }
        
        
    }
    
    func selectDefaultCustomerSource(source: STPSource, completion: STPErrorBlock) {
        
    }
    
    func attachSourceToCustomer(source: STPSource, completion: STPErrorBlock) {
        
    }

}
