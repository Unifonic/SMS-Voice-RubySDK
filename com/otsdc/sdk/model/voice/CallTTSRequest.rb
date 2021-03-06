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


  CallTTSRequest
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../ModelARequest"

class CallTTSRequest < ModelARequest
  @callType
  @callerID
  @timeScheduled
  @voice
  @delay
  @repeat
  
  def initialize(recipient, content, language)
    super()
    @content = content
    @recipient = recipient
    @language = language
  end
  
  def getContent
    return @content
  end
  
  def getRecipient
    return @recipient
  end
  
  def getLanguage
    return @language
  end
    
  def getCallType
    return @callType
  end
  
  def setCallType(callType)
    @callType = callType
  end
        
  def getCallerID
    return @callerID
  end
  
  def setCallerID(callerID)
    @callerID = callerID
  end
        
  def getTimeScheduled
    return @timeScheduled
  end
  
  def setTimeScheduled(timeScheduled)
    @timeScheduled = timeScheduled
  end
        
  def getVoice
    return @voice
  end
  
  def setVoice(voice)
    @voice = voice
  end
        
  def getDelay
    return @delay
  end
  
  def setDelay(delay)
    @delay = delay
  end
        
  def getRepeat
    return @repeat
  end
  
  def setRepeat(repeat)
    if(@callType != nil && @callType == "pull")
      @repeat = repeat
    end
  end
end