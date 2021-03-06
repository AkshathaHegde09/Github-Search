//
//  Utility.swift
//  Github Search
//
//  Created by Akshatha Hegde on 4/10/20.
//  Copyright © 2020 Akshatha Hegde. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class Utility {
    
    class func showDisclaimerAlert(msg: String)
    {
        let alert = UIAlertView(title: "Disclaimer", message: msg, delegate: nil, cancelButtonTitle: "Okay")
        alert.show()
    }
    
    class func showInfoAlert(msg: String)
    {
        let alert = UIAlertView(title: "Info", message: msg, delegate: nil, cancelButtonTitle: "Okay")
        alert.show()
    }
    
    class func showErrorAlert(code: Int)
    {
        var msg = "Something went wrong. Try again later!"
        switch code {
        case 400:
            msg = "We encountered a bad request. Please try again later"
            break
        case 404:
            msg = "The searched user was not found. Please check or alter your keywords"
            break
        case 401:
            msg = "You are not authorized to access this."
            break
        case 500:
            msg = "We encountered an internal server error. Please try again later"
            break
        case 502:
            msg = "We encountered a bad gateway error. Please try again later"
            break
        case 504:
            msg = "We encountered a timeout. Please try again later"
            break
        default:
            msg = "Something went wrong. Try again later!"
        }
        showErrorAlert(msg: msg)
    }
    
    class func showErrorAlert(msg: String)
    {
        let alert = UIAlertView(title: "Err", message: msg, delegate: nil, cancelButtonTitle: "Okay")
        alert.show()
    }
    
    class func dateFormatFunc(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
        return formatter.string(from: date)
    }
    
    class func dateString(dateString: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        if let dt = dateFormatter.date(from: dateString)
        {
            return dateFormatFunc(date: dt)
        }
        return "Date not found!"
    }
    
    
    class func isInternetAvailable() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }

}
