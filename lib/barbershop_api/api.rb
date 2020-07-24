require "http"
module BarbershopApi
    class API 
        def self.api_key
            begin 
                @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip
            rescue 
                puts "Whoops! API key is missing. You can get is from: https://ultimateelementor.com/docs/get-yelp-api-key/."
                @@key = gets.strip
                File.open(File.expand_path("~/.yelp-api-key"), "w") do |file|
                    file.print @@key 
                end 
                @@key 
            end 
        end

        def self.search(term, location)
            url = "https://api.yelp.com/v3/businesses/search"
            params = {
                term: term,
                location: location
            }
            response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
            JSON.parse(response)["businesses"]
        end 

        def self.get_Barbershops
            response = HTTParty.get('https://www.yelp.com/nearme/barber-shops')
            body = response.body
            JSON.parse(body)
        end 
    end 
end 
