//
//  AppDelegate.swift
//  Course3-Day4
//
//  Created by iOS Swift Course on 11/29/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class MegaCoordinator: NSOperation {
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let megaCoordinator = MegaCoordinator()
    
    func application(application                   : UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?
    ) -> Bool {
        
        megaCoordinator.start()
        
        if let not = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] {

            let vc = UIAlertController(title: not.alertTitle, message: not.alertBody, preferredStyle: .Alert)
            vc.addAction(UIAlertAction(title: "Закрыть", style: .Default, handler: nil))
            
            window?.rootViewController?.presentViewController(vc, animated: true, completion: nil)
        }
        
        return true
    }

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification)
    {
        let vc = UIAlertController(title: "Заявка", message: "Получено notification", preferredStyle: .Alert)
        vc.addAction(UIAlertAction(title: "Закрыть", style: .Default, handler: nil))
        
        window?.rootViewController?.presentViewController(vc, animated: true, completion: nil)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

