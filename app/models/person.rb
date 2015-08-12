require 'singleton'

class Person
  
  # For now, there is only one Person
  # We do it this way so we can extend to many people in future
  include Singleton
  
  # Today's step count
  def steps
    $fitbit.activities_on_date('today')["summary"]["steps"]
  end
  
end