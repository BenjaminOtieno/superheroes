class Hero < ApplicationRecord
    has_many :heropowers
    has_many :powers, through: :heropowers
end