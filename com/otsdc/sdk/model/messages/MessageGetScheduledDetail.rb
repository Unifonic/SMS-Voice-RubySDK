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


MessageGetScheduledDetail
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

class MessageGetScheduledDetail < ModelResponse
  @messageID
  @messageBody
  @senderID
  @recipient
  @timeScheduled
  @status
  
  def initialize(messageID, messageBody, senderID, recipient, timeScheduled, status)
    @messageID = messageID
    @messageBody = messageBody
    @senderID = senderID
    @recipient = recipient
    @timeScheduled = timeScheduled
    @status = status
  end
  
  def getMessageID
    return @messageID
  end
  
  def getMessageBody
    return @messageBody
  end
  
  def getSenderID
    return @senderID
  end
  
  def getRecipient
    return @recipient
  end
  
  def getTimeScheduled
    return @timeScheduled
  end
  
  def getStatus
    return @status
  end
  
  def toString
    return "{MessageID="+@messageID.to_s+", MessageBody="+@messageBody.to_s+", senderID="+@senderID.to_s\
    + ", Recipient="+@recipient.to_s\
    + ", TimeScheduled="+@timeScheduled.to_s+", Status="+@status.to_s+"}"
            
  end
end