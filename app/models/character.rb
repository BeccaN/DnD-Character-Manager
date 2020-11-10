class Character < ActiveRecord::Base
    belongs_to :user

    validates :name, :race, :class_lvl, :alignment, :personality, :photo, presence: true
end
