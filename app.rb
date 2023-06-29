class App
    def initialize
       @book = []
       @person = []
       @rentals = []
    end

    def list_all_book
        puts "These are all books"
    end

    def list_all_peaple
        puts "These are all people"
    end

    def create_person
        puts "Person created"
    end
    
    def create_book
        puts "Book created"
    end

    def create_rental
        puts "Rental created"
    end

    def list_all_rentals
      puts "Displayed rental by Id "
    end
end