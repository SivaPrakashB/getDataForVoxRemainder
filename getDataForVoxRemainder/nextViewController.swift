        //
        //  nextViewController.swift
        //  getDataForVoxRemainder
        //
        //  Created by Apple on 27/07/18.
        //  Copyright © 2018 senovTech. All rights reserved.
        //
        
        import UIKit
        
        class nextViewController: UIViewController {
            let buttonA=UIButton()
            override func viewDidLoad() {
                super.viewDidLoad()
               // buttonA.frame=CGRect(x: 10, y: 10, width: 100, height: 200)
                buttonA.backgroundColor=UIColor.green
                buttonA.setTitle("DismissView", for: .normal)
                buttonA.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
                self.view.addSubview(buttonA)
                //apply constrains to button
                buttonA.translatesAutoresizingMaskIntoConstraints = false
                let horizontalConstraint = NSLayoutConstraint(item: buttonA, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
                let verticalConstraint = NSLayoutConstraint(item: buttonA, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
                let widthConstraint = NSLayoutConstraint(item: buttonA, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
                let heightConstraint = NSLayoutConstraint(item: buttonA, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100)
                view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
                
                
                
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
            @objc func dimissView()
            {
                dismiss(animated: true, completion: nil)
            }
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                dismiss(animated: true, completion: nil)
            }
        }
