//
//  abc.swift
//  getDataForVoxRemainder
//
//  Created by Apple on 27/07/18.
//  Copyright © 2018 senovTech. All rights reserved.
//

import Foundation

class AddOnResponse {
    var completed_reminders: [NSDictionary]?
    var upcoming_reminders: [NSDictionary]?
    
    init(completed_reminders:[NSDictionary]?,upcoming_reminders: [NSDictionary]?){
        self.completed_reminders = completed_reminders
        self.upcoming_reminders = upcoming_reminders
    }
}


/*class completed_reminders {
    
    
    
    var alertBefore:String?
    var alertStatus:Int?
    var  audioContentType:String?
    var audioFileId:String?
    var  category:String?
    var  createdDate:String?
    var date:String?
    var id:Int?
    var imageContentType:String?
    var imageFileId:String?
    var message:String?
    var modifiedDate:String?
    var recipients:Int?
    var recipientsNames:String?
    var status:Int?
    var time:String?
    var timeZoneId:String?
    var userId:Int?
    
    
    init(alertBefore:String?,alertStatus:Int?,audioContentType:String?,audioFileId:String?,category:String?,createdDate:String?,date:String?,id:Int?,imageContentType:String?,imageFileId:String?,message: String?,modifiedDate:String?,recipients:Int?,recipientsNames:String?,status:Int?,time:String?,timeZoneId:String?,userId:Int?){
        
       self.alertBefore = alertBefore
       self.alertStatus = alertStatus
       self.audioContentType = audioContentType
       self.audioFileId = audioFileId
       self.category = category
       self.createdDate = createdDate
       self.date = date
       self.id = id
       self.imageContentType = imageContentType
       self.imageFileId = imageFileId
       self.message = message
       self.modifiedDate = modifiedDate
       self.recipients = recipients
       self.recipientsNames = recipientsNames
       self.status = status
       self.time = time
       self.timeZoneId = timeZoneId
       self.userId = userId
        
        
    }
}



class upcoming_reminders {
    
    
    var alertBefore:String?
    var alertStatus:Int?
    var  audioContentType:String?
    var audioFileId:String?
    var  category:String?
    var  createdDate:String?
    var date:String?
    var id:Int?
    var imageContentType:String?
    var imageFileId:String?
    var message:String?
    var modifiedDate:String?
    var recipients:Int?
    var recipientsNames:String?
    var status:Int?
    var time:String?
    var timeZoneId:String?
    var userId:Int?
    
    
    init(alertBefore:String?,alertStatus:Int?,audioContentType:String?,audioFileId:String?,category:String?,createdDate:String?,date:String?,id:Int?,imageContentType:String?,imageFileId:String?,message: String?,modifiedDate:String?,recipients:Int?,recipientsNames:String?,status:Int?,time:String?,timeZoneId:String?,userId:Int?){
        
        self.alertBefore = alertBefore
        self.alertStatus = alertStatus
        self.audioContentType = audioContentType
        self.audioFileId = audioFileId
        self.category = category
        self.createdDate = createdDate
        self.date = date
        self.id = id
        self.imageContentType = imageContentType
        self.imageFileId = imageFileId
        self.message = message
        self.modifiedDate = modifiedDate
        self.recipients = recipients
        self.recipientsNames = recipientsNames
        self.status = status
        self.time = time
        self.timeZoneId = timeZoneId
        self.userId = userId
        
        
    }
}
*/

