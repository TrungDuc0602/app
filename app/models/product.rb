class Product < ApplicationRecord
    has_many :providers
    has_many :combos, :through => :providers
    belongs_to :type
end
