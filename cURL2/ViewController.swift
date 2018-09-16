//
//  ViewController.swift
//  cURL2
//
//  Created by Emin Türk on 16.09.2018.
//  Copyright © 2018 Emin Türk. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var mi : Bool = false
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<BirEnt>  = BirEnt.fetchRequest()
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            print(result)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
        
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        print(documentsDirectory)
        
    mi = isFirstLaunch()
        
        
    }

    func isFirstLaunch() -> Bool {
        let hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: hasBeenLaunchedBeforeFlag)
        if (isFirstLaunch) {
            UserDefaults.standard.set(true, forKey: hasBeenLaunchedBeforeFlag)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }


}

