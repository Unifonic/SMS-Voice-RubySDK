=begin
  The MIT License (MIT)
 
  Copyright (c) 2015 OTS
 
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.


  MessageResourceImpl
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../../constant/ConstantParam"
require_relative "../AResource"
require_relative "../url/MessageUrlImpl"
require_relative "../../model/messages/MessageSendRequest"
require_relative "../../model/messages/MessageSendResponse"
require_relative "../../model/messages/MessageSendBulkRequest"
require_relative "../../model/messages/MessageSendBulkResponse"
require_relative "../../model/messages/MessageIDStatus"
require_relative "../../model/messages/MessageReportRequest"
require_relative "../../model/messages/MessageReportResponse"
require_relative "../../model/messages/MessageDetailsRequest"
require_relative "../../model/messages/MessageDetailsResponse"
require_relative "../../model/messages/MessageGetScheduledRequest"
require_relative "../../model/messages/MessageGetScheduledResponse"
require_relative "../../model/messages/MessageStopScheduled"

class MessageResourceImpl < AResource
  
  @@baseUrl = "http://api.otsdc.com/rest/"
  
  def inialize(appSid)
    super(appSid)
  end
  
  def send(messageSendRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_BODY] = messageSendRequest.getBody
    data[$CONST_RECIPIENT] = messageSendRequest.getRecipient
    
    messageSendRequest.getSenderID != nil ? data[$CONST_SENDERID] = messageSendRequest.getSenderID : ""
    messageSendRequest.getPriority != nil ? data[$CONST_PRIORITY] = messageSendRequest.getPriority : ""
    messageSendRequest.getTimeScheduled != nil ? data[$CONST_TIMESCHEDULED] = messageSendRequest.getTimeScheduled : ""
    
    @messageUrl = MessageUrlImpl. new(@@baseUrl)
    response = sendRequest(@messageUrl.instance_variable_get(:@urlSend), data)
      
    if(response.code >= 200)
      myObj = MessageSendResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def sendBulk(messageSendBulkRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_BODY] = messageSendBulkRequest.getBody
    data[$CONST_RECIPIENT] = messageSendBulkRequest.getRecipient
    
    messageSendBulkRequest.getSenderID != nil ? data[$CONST_SENDERID] = messageSendBulkRequest.getSenderID : ""
    messageSendBulkRequest.getTimeScheduled != nil ? data[$CONST_TIMESCHEDULED] = messageSendBulkRequest.getTimeScheduled : ""
    
    @messageUrl = MessageUrlImpl. new(@@baseUrl)
    response = sendRequest(@messageUrl.instance_variable_get(:@urlSendBulk), data)
      
    if(response.code >= 200)
      myObj = MessageSendBulkResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getMessageIDStatus(messageId)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_MESSAGEID] = messageId
    
    @messageUrl = MessageUrlImpl. new(@@baseUrl)
    response = sendRequest(@messageUrl.instance_variable_get(:@urlGetMessageIDStatus), data)
      
    if(response.code >= 200)
      myObj = MessageIDStatus.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getMessageReport(messageReportRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    
    messageReportRequest.getDateFrom != nil ? data[$CONST_DATE_FROM] = messageReportRequest.getDateFrom : ""
    messageReportRequest.getDateTo != nil ? data[$CONST_DATE_TO] = messageReportRequest.getDateTo : ""
    messageReportRequest.getSenderID != nil ? data[$CONST_SENDERID] = messageReportRequest.getSenderID : ""
    messageReportRequest.getStatus != nil ? data["status"] = messageReportRequest.getStatus : ""
    messageReportRequest.getDlr != nil ? data[$CONST_DLR] = messageReportRequest.getDlr : ""
    messageReportRequest.getCountry != nil ? data[$CONST_COUNTRY] = messageReportRequest.getCountry : ""

    @messageUrl = MessageUrlImpl. new(@@baseUrl)
    response = sendRequest(@messageUrl.instance_variable_get(:@urlGetMessageReport), data)
      
    if(response.code >= 200)
      myObj = MessageReportResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getMessageDetails(messageDetailsRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    
    messageDetailsRequest.getMessageID != nil ? data[$CONST_MESSAGEID] = messageDetailsRequest.getMessageID : ""
    messageDetailsRequest.getDateFrom != nil ? data[$CONST_DATE_FROM] = messageDetailsRequest.getDateFrom : ""
    messageDetailsRequest.getDateTo != nil ? data[$CONST_DATE_TO] = messageDetailsRequest.getDateTo : ""
    messageDetailsRequest.getSenderID != nil ? data[$CONST_SENDERID] = messageDetailsRequest.getSenderID : ""
    messageDetailsRequest.getStatus != nil ? data["status"] = messageDetailsRequest.getStatus : ""
    messageDetailsRequest.getDLR != nil ? data[$CONST_DLR] = messageDetailsRequest.getDLR : ""
    messageDetailsRequest.getCountry != nil ? data[$CONST_COUNTRY] = messageDetailsRequest.getCountry : ""
    messageDetailsRequest.getLimit != nil ? data["limit"] = messageDetailsRequest.getLimit : ""
    
    @messageUrl = MessageUrlImpl. new(@@baseUrl)
    response = sendRequest(@messageUrl.instance_variable_get(:@urlGetMessageDetails), data)
    
    if(response.code >= 200)
      myObj = MessageDetailsResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
   
  def getScheduledMessages(messageGetScheduledRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    
    messageGetScheduledRequest.getMessageID != nil ? data[$CONST_MESSAGEID] = messageGetScheduledRequest.getMessageID : ""
    
    @messageUrl = MessageUrlImpl. new(@@baseUrl)
    response = sendRequest(@messageUrl.instance_variable_get(:@urlGetScheduledMessages), data)
      
    if(response.code >= 200)
      myObj = MessageGetScheduledResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
    
  def getStopScheduledMessages(messageID)
    data = Hash.new
     data[$CONST_APPSID] = @appSid
     data[$CONST_MESSAGEID] = messageID
     
     @messageUrl = MessageUrlImpl. new(@@baseUrl)
     response = sendRequest(@messageUrl.instance_variable_get(:@urlStopScheduledMessages), data)
       
     if(response.code >= 200)
       myObj = MessageStopScheduled.new
       return myObj.initWithJSONString(response.body)
     else
       raise "Status Code : #{response.code} with reason : "
     end
  end
    
end