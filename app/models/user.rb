class User < ApplicationRecord
    has_many :tickets
    has_many :comments

    enum role: { customer: 0, agent: 1 }
end
