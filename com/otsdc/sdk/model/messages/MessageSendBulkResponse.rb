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


  MessageSendBulkResponse
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../ModelResponse"
require_relative "MessageSendBulkDetail"

class MessageSendBulkResponse < ModelResponse
  @numberOfUnits
  @cost
  @currencyCode
  @balance
  @timeCreated
  @messages
  
  def initWithJSONString(jsonResp)
    @success = jsonResp["success"]
    @message = jsonResp["message"]
    @errorCode = jsonResp["errorCode"]
    @data = jsonResp["data"]
    
    if(@data != nil && @data.length > 0)
        @numberOfUnits = @data["NumberOfUnits"]
        @cost = @data["Cost"]
        @currencyCode = @data["CurrencyCode"]
        @balance = @data["Balance"]
        @timeCreated = @data["TimeCreated"]
          
      listMessage = @data["Messages"]
                
      @messages = []
      listMessage.each do |s|
        messageBulk = MessageSendBulkDetail.new(s["MessageID"], s["Recipient"], s["Status"])
        @messages.push(messageBulk)
      end
    end
    
    return self
  end
    
  def getNumberOfUnits
    return @numberOfUnits
  end
  
  def getCost
    return @cost
  end
  
  def getCurrencyCode
    return @currencyCode
  end
   
  def getBalance
    return @balance
  end
    
  def getTimeCreated
    return @timeCreated
  end
  
  def getMessages
    return @messages
  end
  
  def toString
    return "{success="+@success.to_s+", message="+@message.to_s+", errorCode="+@errorCode.to_s\
    + ", MessageResponse{" \
    + ", NumberOfUnits="+@numberOfUnits.to_s\
    + ", Cost="+@cost.to_s+", Balance="+@balance.to_s+", TimeCreated="+@timeCreated.to_s\
    + ", CurrencyCode="+@currencyCode.to_s+"}}"
            
  end
    
end