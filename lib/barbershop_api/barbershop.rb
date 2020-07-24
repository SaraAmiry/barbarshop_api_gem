module BarbershopApi
    class Barbershop 

        @@all = []

        def self.all 
            @@all 
        end 

        def self.find_by_number(number)
            self.all[number.to_i-1]
        end 

        def self.load_by_location(location)
            location_results = API.search("barbershop", location)
            @@all = self.create_from_result(location_results)
        end 

        def self.create_from_result(search_result)
            search_result.map do |barbers_info_hash|
                self.new(barbers_info_hash)
            end 
        end 

        attr_accessor :id, :name, :rating, :location, :phone,

        def initialize(attributes={})
            attributes.each do |att_name, att_value|
                if self.respond_to?("#{att_name}=")
                  self.send("#{att_name}=", att_value)
                end
            end
        end 
        def details
            <<-HEREDOC
#{self.name} with a  rating of #{self.rating}
#{self.address}
#{self.phone}
 
            HEREDOC
        end 

        def address 
            location["display_address"].join("\n")
        end
    end 
end 
 