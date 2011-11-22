module ContactsFetcher
  class Gmail
    def self.fetch(auth_token, username)
      require "net/http"
      require 'net/https'
      require 'nokogiri'
      require 'rubygems'
      
      uri = URI.parse("http://www.google.com/m8/feeds/contacts/#{username}/full")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      headers = {'Authorization' => "GoogleLogin auth=#{auth_token}"}
      request.initialize_http_header(headers)
      response, data = http.request(request)  

      doc  = Nokogiri::XML.parse(data)
      
      contacts = doc.root.xpath('.//gd:email', {'gd' => 'http://schemas.google.com/g/2005'}).map { |e|
        e.attributes['address'].value
      }
      return contacts
    end
    
    def self.authenticate(username, password)
      require "net/http"
      require 'rubygems'
      require 'net/https'
      
      path = '/accounts/ClientLogin'  
      data = ["accountType=HOSTED_OR_GOOGLE",   
              "Email=#{username}",  
              "Passwd=#{password}",  
              "service=cp"].join('&')  
        
      http = Net::HTTP.new(host='www.google.com', port=443)  
      http.use_ssl = true  
      http.start
      resp, data = http.post(path, data)  

      resp.code == "200" ? token = data[/Auth=(.*)/, 1] : nil
      return token
    end
  end
  
  class Yahoo
    def self.authenticate(username, password)
      require 'net/https'

      http = Net::HTTP.new('login.yahoo.com', 443)
      http.use_ssl = true
      http.start do |http|
         req = Net::HTTP::Get.new('/config/login')
         # we make an HTTP basic auth by passing the
         # username and password
         req.basic_auth username, password
         resp, data = http.request(req)
      end
      
      uri = URI.parse("http://query.yahooapis.com/v1/yql")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      params = "q=select%20*%20from%20yahoo.identity%20where%20yid%3D'#{username}'"
      response, data = http.request(request, params)  
      puts data
    end
  end
end

ContactsFetcher::Gmail.authenticate("hoangnghiem1711", "springking")
