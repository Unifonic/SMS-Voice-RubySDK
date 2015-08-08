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


  CallIDStatusResponse
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../ModelResponse"

class CallIDStatusResponse < ModelResponse
  @callStatus
  @callDuration
  @cost
  @dateCreated
  @dateStarted
  @dateEnded
  @response
  @result  
  
  def initWithJSONString(jsonResp)
    @success = jsonResp["success"]
    @message = jsonResp["message"]
    @errorCode = jsonResp["errorCode"]
    @data = jsonResp["data"]
    
    if(@data != nil && @data.length > 0)
      @callStatus = @data["callStatus"]
      @callDuration = @data["CallDuration"]
      @cost = @data["Price"]
      @dateCreated = @data["DateCreated"]
      @dateStarted = @data["DateStarted"]
      @dateEnded = @data["DateEnded"]
      @response = @data["Response"]
      @result = @data["result"]
    end
    
    return self
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
   
  def getDateCreated
    return @dateCreated
  end
   
  def getDateStarted
    return @dateStarted
  end
  
  def getDateEnded
    return @dateEnded 
  end
    
  def getResponse
    return @response
  end
    
  def getResult
    return @result
  end
    
  def toString
    return "{success="+@success.to_s+", message="+@message.to_s+", errorCode="+@errorCode.to_s\
    + ", MessageResponse{CallStatus="+@callStatus.to_s+", CallDuration="+@callDuration.to_s+"\
      , Cost="+@cost.to_s+", DateCreated="+@dateCreated.to_s+"\
      , DateStarted="+@dateStarted.to_s+", DateEnded="+@dateEnded.to_s+", Response="+@response.to_s+"\
      , Result="+@result.to_s+"}}"
            
  end
end