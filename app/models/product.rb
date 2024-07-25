class Product < ApplicationRecord
    belongs_to :category

    validates :name, presence: true
    validates :description, presence: true
    validates :quantity, presence: true, numericality: true
    validates :price, presence: true, numericality: true
end
