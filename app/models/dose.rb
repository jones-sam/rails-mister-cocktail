# frozen_string_literal: true

class Dose < ApplicationRecord
  belongs_to :cocktail, presence: true, unique: true
  belongs_to :ingredient, presence: true, unique: true

  validates_presence_of :description
end
