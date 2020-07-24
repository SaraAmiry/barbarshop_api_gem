module BarbershopApi
    class CLI  
        def initialize
           @input = "" 
        end
        def start
            puts "\n*************************************************"
            puts "Welcome to our program. Let's Find Barbershop."
            while @input != "exit"
              set_location 
              start_barber_picker
            end  
            goodbye 
        end 
        def start_barber_picker
            list_barbershops
            ask_for_choice
            while @input != "exit" && @input != "back"
                binding.pry if @input == "debug"
               if @input == "list"
                  list_barbershops
               elsif valid? 
                 puts Barbershop.find_by_number(@input).details
               else
                  puts "Whoops! try again"
               end
                ask_for_choice  
            end 
        end
        
        def set_location
            puts "Where do you want to go?"
            puts "*************************************************"
            @location = gets.chomp
            Barbershop.load_by_location(@location)
        end 

        def list_barbershops
            Barbershop.all.each.with_index(1) do |shop, index|
                puts "#{index}- #{shop.name}"
            end 
        end 

        def ask_for_choice
            list_choice
            @input = gets.strip.downcase
        end 

        def list_choice
            puts [
                "\nTo see more information by a barber, type its number and hit enter",
                "if you like to go back to main menu, type 'back'",
                "if you would like to exit the program, simply type 'exit'"
            ]
        end 

        def valid?
            @input.to_i.between?(1, Barbershop.all.length)
        end 

        def goodbye
            puts "\nThanks for using our program"
            puts "Bye Bye"
        end 
    end
end 