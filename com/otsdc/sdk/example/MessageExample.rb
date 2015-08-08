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


  MessageExample
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require_relative "../resources/http/MessageResourceImpl"

begin
  messageResource = MessageResourceImpl. new("cYWr62UeR6mbGZw6qHWUhiVX8z5ed")
  #response = accountResource.deleteSenderID("966500199715")
  
  messageSendRequest = MessageSendRequest.new("test", "962789309519")
  response = messageResource.send(messageSendRequest)
  puts response.toString()
  
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end

=begin
begin
  messageResource = MessageResourceImpl. new("cYWr62UeR6mbGZw6qHWUhiVX8z5ed")
  #response = accountResource.deleteSenderID("966500199715")
  recipients = []
  recipients.push("962789309519")
  
  messageSendRequest = MessageSendBulkRequest.new("test", recipients)
  response = messageResource.sendBulk(messageSendRequest)
  puts response.toString()
  
#  response.getMessages().each do |x|
#     puts x.toString()
#  end
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end
=end

=begin
begin
  messageResource = MessageResourceImpl. new("cYWr62UeR6mbGZw6qHWUhiVX8z5ed")
  #response = accountResource.deleteSenderID("966500199715")
  response = messageResource.getMessageIDStatus("166635885")
  puts response.toString()
  
#  response.getMessages().each do |x|
#     puts x.toString()
#  end
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end
=end

=begin
begin
  messageResource = MessageResourceImpl. new("cYWr62UeR6mbGZw6qHWUhiVX8z5ed")
  #response = accountResource.deleteSenderID("966500199715")
  messageSendRequest = MessageReportRequest.new
  response = messageResource.getMessageReport(messageSendRequest)
  puts response.toString()
  
#  response.getMessages().each do |x|
#     puts x.toString()
#  end
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end
=end

=begin
begin
  messageResource = MessageResourceImpl. new("cYWr62UeR6mbGZw6qHWUhiVX8z5ed")
  #response = accountResource.deleteSenderID("966500199715")
  messageSendRequest = MessageDetailsRequest.new
  response = messageResource.getMessageDetails(messageSendRequest)
  puts response.toString()
  
  response.getMessages().each do |x|
     puts x.toString()
  end
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end
=end

=begin
begin
  messageResource = MessageResourceImpl. new("cYWr62UeR6mbGZw6qHWUhiVX8z5ed")
  #response = accountResource.deleteSenderID("966500199715")
  messageSendRequest = MessageGetScheduledRequest.new
  response = messageResource.getScheduledMessages(messageSendRequest)
  puts response.toString()
  
  response.getMessages().each do |x|
     puts x.toString()
  end
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end
=end

=begin
begin
  messageResource = MessageResourceImpl. new("cYWr62UeR6mbGZw6qHWUhiVX8z5ed")
  #response = accountResource.deleteSenderID("966500199715")
  messageSendRequest = MessageGetScheduledRequest.new
  response = messageResource.getStopScheduledMessages("11939")
  puts response.toString()
  
#  response.getMessages().each do |x|
#     puts x.toString()
#  end
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end
=end