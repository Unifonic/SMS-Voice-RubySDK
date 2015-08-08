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


  CallGetScheduledResponse
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../ModelResponse"
require_relative "CallGetScheduledDetail"

class CallGetScheduledResponse < ModelResponse
  @totalVoiceCalls
  @page
  @messages
  
  def initWithJSONString(jsonResp)
    @success = jsonResp["success"]
    @message = jsonResp["message"]
    @errorCode = jsonResp["errorCode"]
    @data = jsonResp["data"]
    
    if(@data != nil && @data.length > 0)
      @totalVoiceCalls = @data["TotalVoiceCalls"]
      @page = @data["Page"]
        
      listMessage = @data["messages"]
                
      @messages = []
      listMessage.each do |s|
        getScheduledResponse = CallGetScheduledDetail.new(s["CallID"], s["Content"], s["Recipient"], s["TimeScheduled"], s["Status"])
        @messages.push(getScheduledResponse)
      end
    end
    
    return self
  end
  
  def getTotalVoiceCalls
    return @totalVoiceCalls
  end
  
  def getPage
    return @page
  end
  
  def getMessages
    return @messages
  end
  
  def toString
    return "{success="+@success.to_s+", message="+@message.to_s+", errorCode="+@errorCode.to_s\
    + ", MessageResponse{TotalVoiceCalls="+@totalVoiceCalls.to_s+", Page="+@page.to_s+"}}"
            
  end
  
end