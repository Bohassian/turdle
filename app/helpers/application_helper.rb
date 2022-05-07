# frozen_string_literal: true

# Foo
module ApplicationHelper
  def animal_options
    options_for_select(Animal.all.map { |animal| [animal.name, animal.id] })
  end

  BOX_CLASSES = %w[border-solid h-14 w-14 border-2 border-gray-300 text-center].freeze
  UP_ARROW = "↑"
  DOWN_ARROW = "↓"

  # @param guess [Guess]
  def guess_box(guess, field)
    classes = case field
              when :diet
                [*BOX_CLASSES, diet_bg(guess)]
              else
                [*BOX_CLASSES, guess_bg(guess, field)]
              end

    content_tag(:div, content(guess, field), class: classes.join(" "))
  end

  def content(guess, field)
    return if guess.pending?
    return guess.diet if field.equal?(:diet)

    diff = guess.send("#{field}_difference")
    arrow = diff.positive? ? DOWN_ARROW : UP_ARROW
    arrow = "✯" if diff.zero?

    [diff, arrow].join("<br/>").html_safe
  end

  def diet_bg(guess)
    return if guess.pending?
    return "bg-green-500" if guess.diet_correct?

    "bg-red-500"
  end

  def guess_bg(guess, field)
    return if guess.pending?

    diff = guess.send("#{field}_difference")
    return "bg-green-500" if diff.zero?

    "bg-yellow-500"
  end
end
