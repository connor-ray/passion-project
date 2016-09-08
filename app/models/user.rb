class User < ActiveRecord::Base
  has_many :flakes
end
