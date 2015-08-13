require 'singleton'

class Person
  
  # For now, there is only one Person
  # We do it this way so we can extend to many people in future
  include Singleton
  
  # Today's step count
  def steps
    $fitbit.activities_on_date('today')["summary"]["steps"]
  end
  
  # Today's weight
  def weight
    lb_to_kg $fitbit.body_measurements_on_date('today')["body"]["weight"]
  end
  
  # Today's BMI
  def bmi
    $fitbit.body_measurements_on_date('today')["body"]["bmi"]
  end
  
  
  private
  
  def lb_to_kg(lb)
    lb * 0.45359237
  end
  
end