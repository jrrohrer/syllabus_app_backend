class Category < ApplicationRecord
  has_many :syllabuses #(thanks, ActiveRecord for the weird pluralization rules)
end
