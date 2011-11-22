class BidIncrement

  def self.get_increment(value)
    increment = 0
    if value <= 10 
      increment = 1
    elsif value > 10 && value <= 50 
      increment = 3
    elsif value > 50 && value <= 100 
      increment = 5
    elsif value > 100 && value <= 500 
      increment = 10
    elsif value > 500 && value <= 1000 
      increment = 20
    elsif value > 1000 && value <= 5000 
      increment = 30
    elsif value > 5000 && value <= 10000 
      increment = 40                                          
    else
      increment = 50
    end
    increment  
  end
end
