class Template < ApplicationRecord
    has_and_belongs_to_many :tags
    belongs_to :user
    has_one_attached :file, dependent: :destroy
    validates :title, presence: true, length: {minimum: 2, maximum: 100}
    validate :image_path_exists
    

    def image_path_exists
        require 'open-uri'

        begin
            path = URI.open(image_path)
            errors.add(:image_path, "does not contain image content") and return unless path.content_type.starts_with?("image")
            
        rescue 
            errors.add(:image_path, "invalid url")
            
        else
            
        end
    end

 
      
end
