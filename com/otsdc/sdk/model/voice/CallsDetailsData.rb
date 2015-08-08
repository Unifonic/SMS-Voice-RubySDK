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


  CallsDetailsData
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

class CallsDetailsData
  @callID
  @audioURL
  @recipientNumber
  @country
  @callStatus
  @timeCreated
  @timeSent
  @timeAnswered
  @timeEnded
  @callDuration
  @cost
  @response
  
  def initialize(callID, audioURL, recipientNumber, country, callStatus, timeCreated, timeSent, timeAnswered, timeEnded, callDuration, cost, response)
    @callID = callID
    @audioURL = audioURL
    @recipientNumber = recipientNumber
    @country = country
    @callStatus = callStatus
    @timeCreated = timeCreated
    @timeSent = timeSent
    @timeAnswered = timeAnswered
    @timeEnded = timeEnded
    @callDuration = callDuration
    @cost = cost
    @response = response
  end
  
  def getCallID
    return @callID
  end
  
  def getAudioUrl
    return @audioURL
  end
   
  def getRecipientNumber
    return @recipientNumber
  end
    
  def getCountry
    return @country
  end
    
  def getCallStatus
    return @callStatus
  end
    
  def getTimeCreated
    return @timeCreated
  end
  
  def getTimeSent
    return @timeSent
  end
    
  def getTimeAnswered
    return @timeAnswered
  end
  
  def getTimeEnded
    return @timeEnded
  end
    
  def getCallDuration
    return @callDuration
  end
    
  def getCost
    return @cost
  end
    
  def getResponse
    return @response
  end
    
  def toString
    return "{CallID="+@callID.to_s+", AudioURL="+@audioURL.to_s+", RecipientNumber="+@recipientNumber.to_s\
    + ", Country="+@country.to_s+", CallStatus="+@callStatus.to_s+"\
      , TimeCreated="+@timeCreated.to_s+", TimeSent="+@timeSent.to_s+"\
      , TimeAnswered="+@timeAnswered.to_s+", TimeEnded="+@timeEnded.to_s+"\
      , CallDuration="+@callDuration.to_s+", Cost="+@cost.to_s+", Response="+@response.to_s+"}}"
            
  end
end