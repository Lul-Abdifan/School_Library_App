require_relative "student"
require_relative "person"
class App
    def initialize
       @books = []
       @people = []
       @rentals = []
    end

    def list_all_book
        puts "These are all books"
    end

    def list_all_peaple
        puts "These are all people"
    end

    def create_person
        puts "Do you want a student(1) or a teacher(2)? [input the number]:"
        choice = gets.chomp.to_i
        case choice
        when 1
        create_student
        when 2
        create_teacher
        end


    end
    def create_student
        print "Age:"
        age = Integer(gets.chomp)
        print "Name:"
        name = String(gets.chomp)
        print "Has parent permission? [Y/N]:"
        permission = gets.chomp.downcase
      
        case permission
        when 'y'
            student = Student.new(nil,age,name,parent_permission: true)
        when 'n'
            student = Student.new(nil,age,name,parent_permission: false)
        else
          puts "Incorrect input"
          return
        end


        @people << student if student
        puts "Person created successfully"
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