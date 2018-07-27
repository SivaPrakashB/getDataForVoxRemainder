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
                guard let abc:[NSDictionary]=addOnRes?.completed_reminders else {
                    return print("Model view class is empty")
                }
                //getTheDataFromServer()
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
                
            }

            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }
            
            func getTheDataFromServer()
            {
                let url=URL(string: "http://52.23.208.8:8080/VoxReminder/mobile/getDashboardReminders?mobileNumber=919778036860&token=BCmW9IXs")
                var request=URLRequest(url: url!)
                request.setValue("json/text", forHTTPHeaderField: "Content_Type")
                request.httpMethod="GET"
                let task=URLSession.shared.dataTask(with: request){ (data, response, error) in
                    if error != nil
                    {
                        print(error?.localizedDescription)
                    }
                    else
                    {
                        if let httpResponse=response as? HTTPURLResponse
                        {
                            if httpResponse.statusCode==200
                            {// Print out reponse body
                                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                                print(responseString)
                                do
                                {let resultJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                                    //print(resultJSON)
                                }
                                catch
                                {
                                    print(error.localizedDescription)
                                }
                            }
                            
                            
                        }
                        
                        
                    }
                }
                task.resume()
                
            }
            
        }
