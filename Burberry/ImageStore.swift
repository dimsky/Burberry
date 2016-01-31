//
//  ImageStore.swift
//  Burberry
//
//  Created by dimsky on 16/1/21.
//  Copyright © 2016年 dimsky. All rights reserved.
//

import Cocoa

@objc class ImageStore: NSObject {
    static let imageNames = [
        "1.pdf",
        "2.pdf",
        "3.pdf",
        "4.pdf",
        "5.pdf",
        "6.pdf",
        "7.pdf"
    ]

    static let messages = [
        "Duang",
        "Duang",
        "Duang",
        "碉堡了",
        "Awesome",
        "Duang",
        "Amazing",
        "Nice",
        "Great",
        "呀买碟",
        "come baby",
        "Have a nice day",
    ]

    class func makeImage() -> BurberryImage {
        let imageNameIndex = Int(arc4random_uniform(UInt32(imageNames.count)))
        let messageIndex = Int(arc4random_uniform(UInt32(messages.count)))

        let imageName = imageNames[imageNameIndex]
        let message = messages[messageIndex]

        return BurberryImage(imageName: imageName, message: message)
    }
}