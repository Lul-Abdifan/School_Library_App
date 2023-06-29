require_relative 'app'
def main
    puts "\nWelcome to the School Library\n\n"
    app = App.new()
    loop do
    options
    choice = gets.chomp.to_i
    handle_input(choice,app)
    end

  end
  
  def options
    puts "\nPlease choose an option by entering a number"
    puts "\n1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person ID"
    puts "7 - Exit\n"
    puts "\n"
  end
 
  def handle_input(choice_input,app)
    case choice_input
    when 1
        app.list_all_books
    when 2
        app.list_all_peaple
    when 3
        app.create_person
    when 4 
        app.create_book
    when 5
        app.create_rental
    when 6
        app.list_all_rentals
    when 7
        puts "Exiting the program. Have a nice time!"
        exit
    else
        puts "Wrong Option,Try Again"
    end
  end
    
  
  main
  

