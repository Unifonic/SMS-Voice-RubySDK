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


  HttpSender
  SmsVoice

  Created by Nirwan Nursabda on 8/8/15.
=end

require 'net/http'
require 'unirest'

class HttpSender
  def requestAlamat(myUrl, params)
    
#    puts params.map{|k,v| ":#{k} => \"#{v}\" "}.join(',')
    
    myHeader = { "Accept" => "application/x-www-form-urlencoded" }
      
    response = Unirest.post myUrl, 
                    headers: myHeader,
                    parameters: params
    
    #response.code # Status code
    #response.headers # Response headers
    #response.body # Parsed body
    #response.raw_body # Unparsed body
#                puts response.body
    
    return response
  end
end

begin
  anray = Hash.new
  anray["AppSid"] = "cYWr62UeR6mbGZw6qHWUhiVX8z5ed"
    
  httpS = HttpSender. new
  response = httpS.requestAlamat("http://api.otsdc.com/rest/Account/GetBalance", anray)
#  puts response.body
#  puts response.body["success"]
#  puts response.headers
#  puts response.code
#  puts response.raw_body
rescue Exception => e             
  puts("Error cause of: "+ e.message)
end