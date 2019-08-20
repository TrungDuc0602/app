class Combo < ApplicationRecord
    has_many :providers
    has_many :products, :through => :providers
end