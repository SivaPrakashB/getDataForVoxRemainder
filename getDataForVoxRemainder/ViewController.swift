//
//  ViewController.swift
//  getDataForVoxRemainder
//
//  Created by Apple on 26/07/18.
//  Copyright © 2018 senovTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var completed_reminders_messagesList=[String]()
    var completed_reminders_dateList=[String]()
    var completed_reminders_receipientsNames=[String]()
    var upcoming_reminders_messagesList=[String]()
    var upcoming_reminders_dateList=[String]()
    var upcoming_reminders_receipientsNames=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getDataFromServer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
func getDataFromServer()
{
    let settingPreferenceURL = URL(string: "http://52.23.208.8:8080/VoxReminder/mobile/getDashboardReminders?mobileNumber=919778036860&token=BCmW9IXs")
    
    var request = URLRequest(url: settingPreferenceURL!)
    
    request.setValue("text/json", forHTTPHeaderField: "Content-Type")
    
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (downloadData, response, error) in
    
        if error == nil
        {
            if let httpResponse = response as? HTTPURLResponse
            {
                if httpResponse.statusCode == 200 //success
                {
                    do
                    {
                        let resDict = try JSONSerialization.jsonObject(with: downloadData!, options: .allowFragments) as! NSDictionary
                        var completed_reminders=resDict.object(forKey: "completed_reminders") as! NSArray
                        for value in completed_reminders
                        {
                            var dummyDict1=value as! NSDictionary
                            var message=dummyDict1.object(forKey: "message") as! String
                            var recipientsNames=dummyDict1.object(forKey: "recipientsNames") as! String
                            var date = dummyDict1.object(forKey: "date") as! String
                            self.completed_reminders_messagesList.append(message)
                            self.completed_reminders_dateList.append(date)
                            self.completed_reminders_receipientsNames.append(recipientsNames)
                            print("completed_reminders_message:",message)
                            print("completed_reminders_date:",date)
                            print("completed_reminders_recipientsNames:",recipientsNames)
                            print("***********************************************")
                        }
                        var upcoming_reminders=resDict.object(forKey: "upcoming_reminders") as! NSArray
                        for value in upcoming_reminders
                        {
                            var dummyDict1=value as! NSDictionary
                            var message=dummyDict1.object(forKey: "message") as! String
                            var recipientsNames=dummyDict1.object(forKey: "recipientsNames") as! String
                            var date = dummyDict1.object(forKey: "date") as! String
                            self.upcoming_reminders_messagesList.append(message)
                            self.upcoming_reminders_dateList.append(date)
                            self.upcoming_reminders_receipientsNames.append(recipientsNames)
                            print("upcoming_reminders_message:",message)
                            print("upcoming_reminders_date:",date)
                            print("upcoming_reminders_recipientsNames:",recipientsNames)
                            print("***********************************************")
                        }
         
                      
                        
                    }
                    catch
                    {
                        print(error)
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    task.resume() //start downlaod
    
    }
    }


