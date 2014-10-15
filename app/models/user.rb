class User < ActiveRecord::Base
  #***************************************************************************#
  #   Created by : Sourav Moitra                                              #
  #   email : astrosourav@gmail.com                                           #
  #   License : The MIT License (MIT)                                         #
  #   Date : October 5th 2014                                                 #
  #***************************************************************************#
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :personal, dependent: :destroy
  has_one :academic, dependent: :destroy
  has_one :stream_selector, dependent: :destroy
end
