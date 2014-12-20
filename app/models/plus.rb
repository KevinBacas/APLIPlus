class Plus < ActiveRecord::Base

  def addPlus
    self.plus_number = self.plus_number + 1
  end

  def subPlus
    self.plus_number = self.plus_number - 1
  end

  def getLaid
    self.plus_number = self.plus_number - 10
  end

end
