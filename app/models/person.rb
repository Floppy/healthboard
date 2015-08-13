require 'singleton'
require 'quantify'
require 'memoist'

class Person
  extend Memoist
  
  # For now, there is only one Person
  # We do it this way so we can extend to many people in future
  include Singleton
  
  # Today's step count
  def steps
    $fitbit.activities_on_date('today')["summary"]["steps"]
  end
  memoize :steps
  
  # Today's weight
  def weight
    $fitbit.body_measurements_on_date('today')["body"]["weight"].lb.to_kg
  end
  memoize :weight
  
  # Today's BMI
  def bmi
    $fitbit.body_measurements_on_date('today')["body"]["bmi"]
  end
  memoize :bmi
    
end