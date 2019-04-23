//
//  AppDelegate.swift
//  Lab 2 - AppEventCount
//
//  Created by Student04 on 2019-04-08.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    
    var viewController: ViewController? //vatiable property allowing AppDelegate to access View Controller and its properties


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       //first use of code 
        viewController = window?.rootViewController as? ViewController //App Delegate able to access instance of View Controller, enables to increment corresponding count properties to viewController
        viewController?.launchCount += 1 //increment the count properties if method is called
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       viewController?.resignActiveCount += 1
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        viewController?.enterBackgroundCount += 1
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
   
        viewController?.enterForegroundCount += 1
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        viewController?.becomeActiveCount += 1
        
        //UPDATE VIEW - called after each of the other life cycle methods is called and just before user interacts with app again (perfect to call for updating count for each method)
        viewController?.updateView()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        viewController?.terminateCount += 1
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Lab_2___AppEventCount")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

