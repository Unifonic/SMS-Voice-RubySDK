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


  EmailResourceImpl
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../../constant/ConstantParam"
require_relative "../AResource"
require_relative "../url/EmailUrlImpl"
require_relative "../../model/email/EmailSendRequest"
require_relative "../../model/email/EmailSendResponse"
require_relative "../../model/email/EmailGetReportRequest"
require_relative "../../model/email/EmailGetReportResponse"

class EmailResourceImpl < AResource
  
  @@baseUrl = "http://api.otsdc.com/rest/"
  
  def inialize(appSid)
    super(appSid)
  end
  
  def send(emailRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    data[$CONST_RECIPIENT] = emailRequest.getRecipient
    data[$CONST_FROM] = emailRequest.getFrom
    data[$CONST_BODY] = emailRequest.getBody
    
    emailRequest.getSubject != nil ? data[$CONST_SUBJECT] = callRequest.getSubject : ""
    
    @emailUrl = EmailUrlImpl. new(@@baseUrl)
    response = sendRequest(@emailUrl.instance_variable_get(:@urlSend), data)
    
    if(response.code >= 200)
      myObj = EmailSendResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
  def getEmailReport(emailRequest)
    data = Hash.new
    data[$CONST_APPSID] = @appSid
    
    emailRequest.getEmailStatus != nil ? data[$CONST_EMAIL_STATUS] = callRequest.getEmailStatus : ""
    emailRequest.getSubject != nil ? data[$CONST_SUBJECT] = callRequest.getSubject : ""
    emailRequest.getDateCreated != nil ? data[$CONST_DATE_CREATED] = callRequest.getDateCreated : ""
    emailRequest.getFrom != nil ? data[$CONST_FROM] = callRequest.getFrom : ""
    emailRequest.getDateFrom != nil ? data[$CONST_DATE_FROM] = callRequest.getDateFrom : ""
    emailRequest.getDateTo != nil ? data[$CONST_DATE_TO] = callRequest.getDateTo : ""

    @emailUrl = EmailUrlImpl. new(@@baseUrl)
    response = sendRequest(@emailUrl.instance_variable_get(:@urlGetEmailsReport), data)
    
    if(response.code >= 200)
      myObj = EmailGetReportResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
     
end