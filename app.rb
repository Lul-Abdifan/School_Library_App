require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'people_management'
require_relative 'book_management'
require_relative 'rentals_management'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end
end
