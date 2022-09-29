class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :is_valid_title
    # custom validations 
    def is_valid_title
        words = ["Won't Believe","Secret","Top [number]","Guess"]
        unless words.any? {|word| if title && !title.match?(word)}
            errors.add(:title, "Does not contain one of the above")
        end
    end
end
