class Tag < ApplicationRecord
    has_and_belongs_to_many :templates
    validates :name, presence: true, length: {minimum: 2, maximum: 100}
end
