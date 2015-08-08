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


  AccountGetSenderIDResponse
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

class AccountGetSenderIDResponse
  @senderId
  @status
  @isDefault
  @dateCreated
  
  def initialize(senderId, status, isDefault, dateCreated)
    @senderId = senderId
    @status = status
    @isDefault = isDefault
    @dateCreated = dateCreated
  end
  
  def toString
    return "{SenderID="+@senderId.to_s+", IsDefault="+@isDefault.to_s+", Status="+@status.to_s \
    + ", DateCreated="+@dateCreated.to_s
  end
  
  def getSenderID
    return @senderId
  end
  
  def getStatus
    return @status
  end
  
  def getIsDefault
    return @isDefault
  end
  
  def getDateCreated
    return @dateCreated
  end
end