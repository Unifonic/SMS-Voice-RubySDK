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


  CallResourceImpl
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../../constant/ConstantParam"
require_relative "../AResource"
require_relative "../url/CallUrlImpl"
require_relative "../../model/voice/CallRequest"
require_relative "../../model/voice/CallResponse"
require_relative "../../model/voice/CallIDStatusResponse"
require_relative "../../model/voice/CallsDetailsRequest"
require_relative "../../model/voice/CallsDetailsResponse"
require_relative "../../model/voice/CallTTSRequest"
require_relative "../../model/voice/CallTTSResponse"
require_relative "../../model/voice/CallGetScheduledRequest"
require_relative "../../model/voice/CallGetScheduledResponse"
require_relative "../../model/voice/CallStopScheduledResponse"

class CallResourceImpl < AResource
  
  @@baseUrl = "http://api.otsdc.com/rest/"
  
  def inialize(appSid)
    super(appSid)
  end
  
  def call(callRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_RECIPIENT] = callRequest.getRecipient
    data[$CONST_CONTENT] = callRequest.getContent
    
    callRequest.getCallType != nil ? data[$CONST_CALL_TYPE] = callRequest.getCallType : ""
    callRequest.getCallerID != nil ? data[$CONST_CALLER_ID] = callRequest.getCallerID : ""
    callRequest.getTimeScheduled != nil ? data[$CONST_TIMESCHEDULED] = callRequest.getTimeScheduled : ""
    callRequest.getDelay != nil ? data[$CONST_DELAY] = callRequest.getDelay : ""
    callRequest.getRepeat != nil ? data[$CONST_REPEAT] = callRequest.getRepeat : ""
    
    @callUrl = CallUrlImpl. new(@@baseUrl)
    response = sendRequest(@callUrl.instance_variable_get(:@urlCall), data)
      
    if(response.code >= 200)
      myObj = CallResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getCallIDStatus(callID)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_CALLID] = callID
    
    @callUrl = CallUrlImpl. new(@@baseUrl)
    response = sendRequest(@callUrl.instance_variable_get(:@urlGetCallIDStatus), data)
      
    if(response.code >= 200)
      myObj = CallIDStatusResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getCallsDetails(callsDetailsRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    callsDetailsRequest.getCallID != nil ? data[$CONST_CALLID] = callsDetailsRequest.getCallID : ""
    callsDetailsRequest.getDateFrom != nil ? data[$CONST_DATE_FROM] = callsDetailsRequest.getDateFrom : ""
    callsDetailsRequest.getDateTo != nil ? data[$CONST_DATE_TO] = callsDetailsRequest.getDateTo : ""
    callsDetailsRequest.getStatus != nil ? data["status"] = callsDetailsRequest.getStatus : ""
    callsDetailsRequest.getCountry != nil ? data[$CONST_COUNTRY] = callsDetailsRequest.getCountry : ""
    
    @callUrl = CallUrlImpl. new(@@baseUrl)
    response = sendRequest(@callUrl.instance_variable_get(:@urlGetCallsDetails), data)
      
    if(response.code >= 200)
      myObj = CallsDetailsResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def ttsCall(ttlsCallRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_RECIPIENT] = ttlsCallRequest.getRecipient
    data[$CONST_CONTENT] = ttlsCallRequest.getContent
    data[$CONST_LANGUAGE] = ttlsCallRequest.getLanguage
    
    ttlsCallRequest.getCallType != nil ? data[$CONST_CALL_TYPE] = ttlsCallRequest.getCallType : ""
    ttlsCallRequest.getCallerID != nil ? data[$CONST_CALLID] = ttlsCallRequest.getCallerID : ""
    ttlsCallRequest.getTimeScheduled != nil ? data[$CONST_TIMESCHEDULED] = ttlsCallRequest.getTimeScheduled : ""
    ttlsCallRequest.getVoice != nil ? data[$CONST_VOICE] = ttlsCallRequest.getVoice : ""
    ttlsCallRequest.getDelay != nil ? data[$CONST_DELAY] = ttlsCallRequest.getDelay : ""
    ttlsCallRequest.getRepeat != nil ? data[$CONST_REPEAT] = ttlsCallRequest.getRepeat : ""
    
    @callUrl = CallUrlImpl. new(@@baseUrl)
    response = sendRequest(@callUrl.instance_variable_get(:@urlTTSCall), data)
      
    if(response.code >= 200)
      myObj = CallTTSResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getScheduled(scheduledRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    
    scheduledRequest.getCallID != nil ? data[$CONST_CALLID] = scheduledRequest.getCallID : ""
    
    @callUrl = CallUrlImpl. new(@@baseUrl)
    response = sendRequest(@callUrl.instance_variable_get(:@urlGetScheduled), data)
      
    if(response.code >= 200)
      myObj = CallGetScheduledResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def stopScheduled(callID)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    
    data[$CONST_CALLID] = callID
    
    @callUrl = CallUrlImpl. new(@@baseUrl)
    response = sendRequest(@callUrl.instance_variable_get(:@urlStopScheduled), data)
      
    if(response.code >= 200)
      myObj = CallStopScheduledResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
      
end