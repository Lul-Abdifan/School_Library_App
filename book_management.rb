def create_book
  puts 'Title:'
  title = gets.chomp.to_s
  puts 'Author:'
  author = gets.chomp.to_s
  book = Book.new(title, author)
  @books.push(book)
  puts "\nBook created successfully"
end

def list_all_books
  if @books.empty?
    puts 'No books'
  else
    @books.each do |book|
      puts "Title: '#{book.title}', Author: '#{book.author}'"
    end
  end
end
