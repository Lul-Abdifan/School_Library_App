require './base_decor'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end
