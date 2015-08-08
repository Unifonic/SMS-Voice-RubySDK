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


MessageDetailsStatus
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

class MessageDetailsStatus < ModelResponse
  @messageID
  @messageBody
  @recipientNumber
  @country
  @status
  @dlr
  @dateCreated
  @dateSent
  @senderID
  @numberOfUnits
  @cost
  
  def initialize(messageID, messageBody, recipientNumber, country, status, dlr, dateCreated, dateSent, senderID, numberOfUnits, cost)
    @messageID = messageID
    @messageBody = messageBody
    @recipientNumber = recipientNumber
    @country = country
    @status = status
    @dlr = dlr
    @dateCreated = dateCreated
    @dateSent = dateSent
    @senderID = senderID
    @numberOfUnits = numberOfUnits
    @cost = cost
  end
  
  def toString
    return "{MessageID="+@messageID.to_s+", MessageBody="+@messageBody.to_s+", RecipientNumber="+@recipientNumber.to_s\
    + ", Country="+@country.to_s+", Status="+@status.to_s+", DLR="+@dlr.to_s\
    + ", DateCreated="+@dateCreated.to_s+", DateSent="+@dateSent.to_s+", SenderID="+@senderID.to_s\
    + ", NumberOfUnits="+@numberOfUnits.to_s+", Cost="+@cost.to_s+"}}"
  end
  
  def getMessageID
    return @messageID
  end
  
  def getMessageBody
    return @messageBody
  end
  
  def getRecipientNumber
    return @recipientNumber
  end
  
  def getCountry
    return @country
  end
  
  def getStatus
    return @status
  end
  
  def getDlr
    return @dlr
  end
  
  def getDateCreated
    return @dateCreated
  end
  
  def getDateSent
    return @dateSent
  end
  
  def getSenderID
    return @senderID
  end
  
  def getNumberOfUnits
    return @numberOfUnits
  end
  
  def getCost
    return @cost
  end
    
end