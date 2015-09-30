# REST API for Ruby

A simple HTTP based RESTful API library will enable your apps to send emails and sms messages, make phone calls, and setup two-factor authentication through [OTS Cloud Communication Platform] (http://www.otsdc.com/en/site/login)

## Installation

If you want to use it yourself, here's the source:
```
$ git clone https://github.com/otsdc/SMS-Voice-RubySDK.git
```

## Example

```
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
  
rescue Exception => e             
  puts("Error cause of: "+ e.message)
  p e.backtrace
end
=end
