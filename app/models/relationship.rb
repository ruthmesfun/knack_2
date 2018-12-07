class Relationship < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :commenter, class_name: "User"
end
