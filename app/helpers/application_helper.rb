# frozen_string_literal: true

# Foo
module ApplicationHelper
  def animal_options
    options_for_select(Animal.all.map { |animal| [animal.name, animal.id] })
  end
end
