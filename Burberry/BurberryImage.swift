//
//  BurberryImage.swift
//  Burberry
//
//  Created by dimsky on 16/1/21.
//  Copyright © 2016年 dimsky. All rights reserved.
//

import Cocoa

@objc class BurberryImage: NSObject {
    let imageName: String
    let message: String

    init(imageName: String, message: String) {
        self.imageName = imageName
        self.message = message
    }
}