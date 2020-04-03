# frozen_string_literal: true

class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true

  # TODO: Dose is uniqe for a given cocktail/ingredient couple
end
