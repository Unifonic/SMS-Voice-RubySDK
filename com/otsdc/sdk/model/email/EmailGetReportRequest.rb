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


  EmailGetReportRequest
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../ModelARequest"

class EmailGetReportRequest < ModelARequest
  @emailStatus
  @subject
  @dateCreated
  @from
  @dateFrom
  @dateTo
  
  def initialize
    super()
  end
  
  def getEmailStatus
    return @emailStatus
  end
  
  def setEmailStatus(emailStatus)
    @emailStatus = emailStatus
  end
      
  def getSubject
    return @subject
  end
  
  def setSubject(subject)
    @subject = subject
  end
      
  def getDateCreated
    return @dateCreated
  end
  
  def setDateCreated(dateCreated)
    @dateCreated = dateCreated
  end
      
  def getFrom
    return @from
  end
  
  def setFrom(from)
    @from = from
  end
      
  def getDateFrom
    return @dateFrom
  end
  
  def setDateFrom(dateFrom)
    @dateFrom = dateFrom
  end
      
  def getDateTo
    return @dateTo
  end
  
  def setDateTo(dateTo)
    @dateTo = dateTo
  end
end