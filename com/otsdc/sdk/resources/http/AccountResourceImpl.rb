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


  AccountResourceImpl
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../AResource"
require_relative "../url/AccountUrlImpl"
require_relative "../../model/account/AccountGetBalance"
require_relative "../../model/account/AccountAddSenderID"
require_relative "../../model/account/AccountGetSenderIDStatus"
require_relative "../../model/account/AccountGetSenderIDs"
require_relative "../../model/account/AccountGetAppDefaultSenderID"
require_relative "../../model/account/AccountChangeAppDefaultSenderID"
require_relative "../../model/account/AccountDeleteSenderID"

class AccountResourceImpl < AResource
  
  @@baseUrl = "http://api.otsdc.com/rest/"
  
  def inialize(appSid)
    super(appSid)
  end
  
  def getBalance
    data = Hash.new
    data["AppSid"] = @appSid
    
    @accountUrl = AccountUrlImpl. new(@@baseUrl)
    response = sendRequest(@accountUrl.instance_variable_get(:@urlGetBalance), data)
      
    if(response.code >= 200)
      myObj = AccountGetBalance.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def addSenderID(senderID)
    data = Hash.new
    data["AppSid"] = @appSid
    data["SenderID"] = senderID
    
    @accountUrl = AccountUrlImpl. new(@@baseUrl)
    response = sendRequest(@accountUrl.instance_variable_get(:@urlAddSenderID), data)
      
    if(response.code >= 200)
      myObj = AccountAddSenderID.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getSenderIDStatus(senderID)
    data = Hash.new
    data["AppSid"] = @appSid
    data["SenderID"] = senderID
    
    @accountUrl = AccountUrlImpl. new(@@baseUrl)
    response = sendRequest(@accountUrl.instance_variable_get(:@urlGetSenderIDStatus), data)
      
    if(response.code >= 200)
      myObj = AccountGetSenderIDStatus.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getSenderIDs
    data = Hash.new
    data["AppSid"] = @appSid
    
    @accountUrl = AccountUrlImpl. new(@@baseUrl)
    response = sendRequest(@accountUrl.instance_variable_get(:@urlGetSenderIDs), data)
      
    if(response.code >= 200)
      myObj = AccountGetSenderIDs.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getAppDefaultSenderID
    data = Hash.new
    data["AppSid"] = @appSid
    
    @accountUrl = AccountUrlImpl. new(@@baseUrl)
    response = sendRequest(@accountUrl.instance_variable_get(:@urlGetAppDefaultSenderID), data)
      
    if(response.code >= 200)
      myObj = AccountGetAppDefaultSenderID.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def changeAppDefaultSenderID(senderID)
    data = Hash.new
    data["AppSid"] = @appSid
    data["SenderID"] = senderID
    
    @accountUrl = AccountUrlImpl. new(@@baseUrl)
    response = sendRequest(@accountUrl.instance_variable_get(:@urlChangeAppDefaultSenderID), data)
      
    if(response.code >= 200)
      myObj = AccountChangeAppDefaultSenderID.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def deleteSenderID(senderID)
    data = Hash.new
    data["AppSid"] = @appSid
    data["SenderID"] = senderID
    
    @accountUrl = AccountUrlImpl. new(@@baseUrl)
    response = sendRequest(@accountUrl.instance_variable_get(:@urlDeleteSenderID), data)
      
    if(response.code >= 200)
      myObj = AccountDeleteSenderID.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
end