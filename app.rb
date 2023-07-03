require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

 private 

 def common_information
  print 'Age :'
  age = Integer(gets.chomp)
  print 'Name :'
  name = String(gets.chomp)
  [age,name]
 end

  def list_all_books
    @books.each do |book|
      puts "Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name:#{person.name}, Id:#{person.id}, Age:#{person.age}"
    end
  end

  def create_person
    puts 'Do you want a student(1) or a teacher(2)? [input the number]:'
    options = {
      1 =>method(:create_student),
      2 =>method(:create_teacher)
    }
    choice = gets.chomp.to_i
    if options.key?(choice)
       options[choice].call
    else
      puts 'Incorrect input'
   end
end

  def create_student
   age,name = common_information
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp.downcase
    parent_permission  = permission == 'y'

    if parent_permission || permission == 'n'
    @people << Student.new(nil, age, name, parent_permission: parent_permission)
    puts "\nPerson created successfully"
    else
      puts "Incorrect Input"
  end
end

  def create_teacher
    age,name = common_information
    print 'Specialization :'
    specialization = String(gets.chomp)
    @people << Teacher.new(specialization, age, name, parent_permission: true)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title :'
    title = String(gets.chomp)
    print 'Author :'
    author = String(gets.chomp)
    book = Book.new(title, author)
    @books.push(book)
    puts "\nBook created successfully"
  end

  def create_rental
    puts "\nSelect a book from the following list by number\n"
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
    end
    selected_book = @books[gets.chomp.to_i]
    puts "\nSelect a person from the following list by number\n"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = @people[gets.chomp.to_i]
    puts 'Date (YYYY-MM-DD):'
    input_date = gets.chomp
    created_rental = Rental.new(input_date, selected_person, selected_book)
    @rentals << created_rental
    puts 'Rental Created successfully'
  end

  def list_all_rentals
    puts "Rentals:\n"
    @rentals.each do |rental|
      puts "\nName:#{rental.person.name} Rented Id:#{rental.person.id}"
    end
    puts "\nId of person:"
    desired_rental_id = gets.chomp.to_i
    desired_rentals = @rentals.select { |rental| rental.person.id == desired_rental_id }

    if desired_rentals.empty?
      puts "Rental not found with ID #{desired_rental_id}"
    else
      puts "Books with ID #{desired_rental_id}:"
      desired_rentals.each do |rental|
        puts "Date: #{rental.date} Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
