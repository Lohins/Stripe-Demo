//
//  StripeService.swift
//  Stripe-Demo
//
//  Created by S.t on 16/8/11.
//  Copyright © 2016年 S.t. All rights reserved.
//
import Foundation


typealias NetworkReqCompletion = (AnyObject?,NSError?) -> Void

class StripeService: AFHTTPSessionManager {
    
    
    class var sharedInstance: StripeService{
        struct Static {
            static let instance: StripeService = StripeService()
        }
        return Static.instance
    }
    
    func getMethod(urlString:String , params: [String:String] , completion: NetworkReqCompletion) {
        self.GET(urlString, parameters: params, success: { (task: NSURLSessionDataTask!, response: AnyObject?) -> Void  in
            if let result = response{
                completion(result , nil)
            }
        }) { (task:NSURLSessionDataTask?, error:NSError) -> Void in
            completion(nil , error)
        }
    }
    
    
    func postMethod(urlString:String , params: [String:String] , completion: NetworkReqCompletion) {
        self.POST(urlString, parameters: params, success: { (task: NSURLSessionDataTask!, response: AnyObject?) -> Void  in
            if let result = response{
                completion(result , nil)
            }
        }) { (task:NSURLSessionDataTask?, error:NSError) -> Void in
            completion(nil , error)
        }
    }
    
}
