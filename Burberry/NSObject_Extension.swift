//
//  NSObject_Extension.swift
//
//  Created by dimsky on 16/1/21.
//  Copyright © 2016年 dimsky. All rights reserved.
//

import Foundation

extension NSObject {
    class func pluginDidLoad(bundle: NSBundle) {
        let appName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? NSString
        if appName == "Xcode" {
        	if sharedPlugin == nil {
        		sharedPlugin = Burberry(bundle: bundle)
        	}
        }
    }
}