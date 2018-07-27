//
//  ViewController.swift
//  getDataForVoxRemainder
//
//  Created by Apple on 26/07/18.
//  Copyright © 2018 senovTech. All rights reserved.
//

import UIKit
 var addOnRes:AddOnResponse?
class ViewController: UIViewController {
    var a=0
    var completed_reminders_messagesList=[String]()
    var completed_reminders_dateList=[String]()
    var completed_reminders_receipientsNames=[String]()
    var upcoming_reminders_messagesList=[String]()
    var upcoming_reminders_dateList=[String]()
    var upcoming_reminders_receipientsNames=[String]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let calendar = Calendar.current
        let day=calendar.component(.day, from: date)
        let month=calendar.component(.month, from: date)
        let year=calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        // Do any additional setup after loading the view, typically from a nib.
        getDataFromServer()
        print("before response calling")
    }

    @IBOutlet weak var label: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
func getDataFromServer()
{//http://thenaradnews.com/WService/GetAds.php
    //let url:URL=URL(string: "http://thenaradnews.com/WService/GetAds.php")!
    let url:URL=URL(string: "http://52.23.208.8:8080/VoxReminder/mobile/getDashboardReminders?mobileNumber=919778036860&token=BCmW9IXs")!
    var request=URLRequest(url: url)
    request.setValue("text/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    let task=URLSession.shared.dataTask(with: request) { (data, response, error) in
    if error != nil
    {
        print(error?.localizedDescription,"not data error")
    }
    else
    {//else condition start for if no error
    if let httpResponse=response as? HTTPURLResponse // response if condition start
    {
        print("response")
        if httpResponse.statusCode == 200 //success
        {
           do
              {
            let resDict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
           addOnRes = AddOnResponse(completed_reminders:resDict["completed_reminders"] as! [NSDictionary], upcoming_reminders:resDict["upcoming_reminders"] as! [NSDictionary])
            //print(self.addOnRes!.completed_reminders)
            // print(self.addOnRes!.upcoming_reminders)
            var completed_reminders=resDict.object(forKey: "completed_reminders") as! NSArray
            var upcoming_reminders=resDict.object(forKey: "upcoming_reminders") as! NSArray
            for value in completed_reminders
            {
                var dummyDict1=value as! NSDictionary
                var message=dummyDict1.object(forKey: "message") as! String
                var recipientsNames=dummyDict1.object(forKey: "recipientsNames") as! String
                var date = dummyDict1.object(forKey: "date") as! String
                self.completed_reminders_messagesList.append(message)
                self.completed_reminders_dateList.append(date)
                self.completed_reminders_receipientsNames.append(recipientsNames)
                // print("completed_reminders_message:",message)
                // print("completed_reminders_date:",date)
                // print("completed_reminders_recipientsNames:",recipientsNames)
                // print("***********************************************")
            }
            
            for value in upcoming_reminders
            {
                var dummyDict1=value as! NSDictionary
                var message=dummyDict1.object(forKey: "message") as! String
                var recipientsNames=dummyDict1.object(forKey: "recipientsNames") as! String
                var date = dummyDict1.object(forKey: "date") as! String
                self.upcoming_reminders_messagesList.append(message)
                self.upcoming_reminders_dateList.append(date)
                self.upcoming_reminders_receipientsNames.append(recipientsNames)
                //print("upcoming_reminders_message:",message)
                // print("upcoming_reminders_date:",date)
                // print("upcoming_reminders_recipientsNames:",recipientsNames)
                // print("***********************************************")
            }
           
        }
        catch
        {
            print(error.localizedDescription,"****data error*****")
            
        }
        
        }//success if condition end
        
    }//response if condition end
    }//else condition close braces
    }//completion handler close braces
    
    task.resume() //start downlaod its end the task it won't wait for response
    
    }
    
    @IBAction func next(_ sender: UIButton) {
        if a==completed_reminders_dateList.count-1
        {
            a=0
            label.text=completed_reminders_receipientsNames[a]
        }
        else
        {
            a=a+1
            label.text=completed_reminders_receipientsNames[a]
        }
    }
    
    
    
    }


