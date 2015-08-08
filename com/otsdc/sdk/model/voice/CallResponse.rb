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


  CallResponse
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../ModelResponse"

class CallResponse < ModelResponse
  @callID
  @callStatus
  @callDuration
  @cost
  @balance
  @recipient
  @dateCreated
  
  def initWithJSONString(jsonResp)
    @success = jsonResp["success"]
    @message = jsonResp["message"]
    @errorCode = jsonResp["errorCode"]
    @data = jsonResp["data"]
    
    if(@data != nil && @data.length > 0)
      @callID = @data["CallID"]
      @callStatus = @data["CallStatus"]
      @callDuration = @data["CallDuration"]
      @cost = @data["Cost"]
      @balance = @data["Balance"]
      @recipient = @data["Recipient"]
      @dateCreated = @data["DateCreated"]
    end
    
    return self
  end
  
  def getCallID
    return @callID
  end
  
  def getCallStatus
    return @callStatus
  end
  
  def getCallDuration
    return @callDuration
  end
    
  def getCost
    return @cost
  end
   
  def getBalance
    return @balance
  end
   
  def getRecipient
    return @recipient
  end
    
  def getDateCreated
    return @dateCreated
  end
    
  def toString
    return "{success="+@success.to_s+", message="+@message.to_s+", errorCode="+@errorCode.to_s\
    + ", MessageResponse{CallID="+@callID.to_s+", CallStatus="+@callStatus.to_s+"\
      , CallDuration="+@callDuration.to_s+", Cost="+@cost.to_s+"\
      , Balance="+@balance.to_s+", Recipient="+@recipient.to_s+", DateCreated="+@dateCreated.to_s+"}}"
            
  end
end