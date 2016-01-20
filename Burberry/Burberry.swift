//
//  Burberry.swift
//
//  Created by dimsky on 16/1/21.
//  Copyright © 2016年 dimsky. All rights reserved.
//

import AppKit

var sharedPlugin: Burberry?

class Burberry: NSObject {

    var bundle: NSBundle
    lazy var center = NSNotificationCenter.defaultCenter()

    init(bundle: NSBundle) {
        self.bundle = bundle

        super.init()
        center.addObserver(self, selector: Selector("createMenuItems"), name: NSApplicationDidFinishLaunchingNotification, object: nil)

        center.addObserver(self, selector: Selector("handlerNotification:"), name: nil, object: nil)
    }

    deinit {
        removeObserver()
    }

    override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }

        dispatch_once(&Static.token) {
            swizzleMethods()
        }
    }

    class func swizzleMethods() {
        guard let originalClass = NSClassFromString("DVTBezelAlertPanel") as? NSObject.Type else {
            return
        }

        originalClass.swizzleWithOriginalSelector("initWithIcon:message:parentWindow:duration:", swizzledSelector: "bur_initWithIcon:message:parentWindow:duration:", isClassMethod: false)
    }

    func removeObserver() {
        center.removeObserver(self)
    }

    func handlerNotification(notifi: NSNotification) {
//        NSLog("---> %%", notifi.name)
    }

    func createMenuItems() {
        removeObserver()

        let item = NSApp.mainMenu!.itemWithTitle("Edit")
        if item != nil {
            let title = Burberry.isEnable() ? "Burberry Default" : "Burberry Custom"
            let actionMenuItem = NSMenuItem(title:title, action:"doMenuAction:", keyEquivalent:"")
            actionMenuItem.target = self
            item!.submenu!.addItem(NSMenuItem.separatorItem())
            item!.submenu!.addItem(actionMenuItem)
        }
    }

    func doMenuAction(menuItem: NSMenuItem) {
//        let error = NSError(domain: "Hello World!", code:42, userInfo:nil)
//        NSAlert(error: error).runModal()

        Burberry.setIsEnable(!Burberry.isEnable())
        menuItem.title = Burberry.isEnable() ? "Burberry Default" : "Burberry Custom"
    }

    class func isEnable() -> Bool {
       return NSUserDefaults.standardUserDefaults().boolForKey("com.dimsky.burberry")
    }

    class func setIsEnable(shouldBeEnabled: Bool) {
        NSUserDefaults.standardUserDefaults().setBool(shouldBeEnabled, forKey: "com.dimsky.burberry")
    }


}

