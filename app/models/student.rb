require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true
  validates_exclusion_of :age, :in => 0..4
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates_format_of :phone, :with => /\(?\d{3}\)?-?\s?\d{3}\-\d{4}/

  def name 
    self.first_name + " " + self.last_name 
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end

