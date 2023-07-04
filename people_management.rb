def common_information
  print 'Age :'
  age = Integer(gets.chomp)
  print 'Name :'
  name = String(gets.chomp)
  [age, name]
end

def create_person
  puts 'Do you want a student(1) or a teacher(2)? [input the number]:'
  options = {
    1 => method(:create_student),
    2 => method(:create_teacher)
  }
  choice = gets.chomp.to_i
  if options.key?(choice)
    options[choice].call
  else
    puts 'Incorrect input'
  end
end

def create_student
  age, name = common_information
  print 'Has parent permission? [Y/N]:'
  permission = gets.chomp.downcase
  parent_permission = permission == 'y'
  if parent_permission || permission == 'n'
    @people << Student.new(nil, age, name, parent_permission: parent_permission)
    puts "\nPerson created successfully"
  else
    puts 'Incorrect Input'
  end
end

def create_teacher
  age, name = common_information
  print 'Specialization :'
  specialization = String(gets.chomp)
  @people << Teacher.new(specialization, age, name, parent_permission: true)
  puts 'Person created successfully'
end

def list_all_people
  if @people.empty?
    puts 'No Student or Teacher'
  else
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end
  end
end
