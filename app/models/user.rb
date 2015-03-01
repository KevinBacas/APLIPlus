class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def addPlus
    res = false
    plus = Plus.new :polarity => true, :user_id => self.id
    if plus.save
      self.plus_number = self.plus_number + 1
      self.max_plus_number = (self.max_plus_number < self.plus_number) ? self.plus_number : self.max_plus_number
      self.save
      res = true
    end
    return res
  end

  def subPlus
    res = false
    plus = Plus.new :polarity => false, :user_id => self.id
    if plus.save
      self.plus_number = self.plus_number - 1
      self.save
      res = true
    end
    return res
  end

  def getLaid
    res = false
    if self.plus_number >= 10
      10.times do
        res = self.subPlus
      end
    end
    return res
  end
end
