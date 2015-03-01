class Plus < ActiveRecord::Base
  default_value_for :date do
    Time.now
  end
end
