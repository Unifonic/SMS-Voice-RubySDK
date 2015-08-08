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


  CheckerResourceImpl
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../AResource"
require_relative "../url/CheckerUrlImpl"
require_relative "../../model/numberinsight/CheckerCheckNumberResponse"

class CheckerResourceImpl < AResource
  
  @@baseUrl = "http://api.otsdc.com/rest/"
  
  def inialize(appSid)
    super(appSid)
  end
  
  def checkNumber(recipient)
    data = Hash.new
    data["AppSid"] = @appSid
    data[$CONST_RECIPIENT] = recipient
    
    @checkerUrl = CheckerUrlImpl. new(@@baseUrl)
    response = sendRequest(@checkerUrl.instance_variable_get(:@urlCheckNumber), data)
      
    if(response.code >= 200)
      myObj = CheckerCheckNumberResponse.new
      return myObj.initWithJSONString(response.body)
    else
      raise "Status Code : #{response.code} with reason : "
    end
  end
  
end