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


  VerifyResourceImpl
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../../constant/ConstantParam"
require_relative "../AResource"
require_relative "../url/VerifyUrlImpl"
require_relative "../../model/verify/VerifyGetCodeRequest"
require_relative "../../model/verify/VerifyGetCodeResponse"
require_relative "../../model/verify/VerifyNumberResponse"

class VerifyResourceImpl < AResource
  
  @@baseUrl = "http://api.otsdc.com/rest/"
  
  def inialize(appSid)
    super(appSid)
  end
  
  def getCode(getCodeRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_RECIPIENT] = getCodeRequest.getRecipient
    data[$CONST_BODY] = getCodeRequest.getBody
    
    getCodeRequest.getSecurityType != nil ? data[$CONST_SECURITY_TYPE] = getCodeRequest.getSecurityType : ""
    getCodeRequest.getExpiry != nil ? data[$CONST_EXPIRY] = getCodeRequest.getExpiry : ""
    getCodeRequest.getSenderID != nil ? data[$CONST_SENDERID] = getCodeRequest.getSenderID : ""
    getCodeRequest.getChannel != nil ? data[$CONST_CHANNEL] = getCodeRequest.getChannel : ""
    getCodeRequest.getLanguage != nil ? data[$CONST_LANGUAGE] = getCodeRequest.getLanguage : ""
    getCodeRequest.getTTL != nil ? data[$CONST_TTL] = getCodeRequest.getTTL : ""

    @verifyUrl = VerifyUrlImpl. new(@@baseUrl)
    response = sendRequest(@verifyUrl.instance_variable_get(:@urlGetCode), data)
    
    if(response.code >= 200)
      myObj = VerifyGetCodeResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def verifyNumber(recipient, passCode)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_RECIPIENT] = recipient
    data[$CONST_PASSCODE] = passCode
    
    @verifyUrl = VerifyUrlImpl. new(@@baseUrl)
    response = sendRequest(@verifyUrl.instance_variable_get(:@urlVerifyNumber), data)
    
    if(response.code >= 200)
      myObj = VerifyNumberResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
end