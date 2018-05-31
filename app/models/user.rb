class User < ApplicationRecord


    # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_initialize {self.role ||= :standard}

  has_many :wikis       


  enum role: [:standard, :premium, :admin]

end
