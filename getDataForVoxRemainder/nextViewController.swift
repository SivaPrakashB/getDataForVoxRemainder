//
//  nextViewController.swift
//  getDataForVoxRemainder
//
//  Created by Apple on 27/07/18.
//  Copyright © 2018 senovTech. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        var abc:[NSDictionary]=addOnRes!.completed_reminders as! [NSDictionary]
        for value in abc
        {
            var dummyDict1=value as! NSDictionary
            var message=dummyDict1.object(forKey: "message") as! String
            var recipientsNames=dummyDict1.object(forKey: "recipientsNames") as! String
            var date = dummyDict1.object(forKey: "date") as! String
            
           print("completed_reminders_message:",message)
            print("completed_reminders_date:",date)
          print("completed_reminders_recipientsNames:",recipientsNames)
         print("***********************************************")
        }
       
 //print(abc,"88888")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
