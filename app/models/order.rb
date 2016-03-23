class Order < ActiveRecord::Base
    before_save do
        self.Toppings.gsub!(/[\[\]\"]/, "") if attribute_present?('Toppings')
    end
    
    validates :Size, presence: true
    validates :quantity, presence: true
    validates :Address, presence: true, :length => { :minimum => 3}
    validates :City, presence: true, :length => { :minimum => 3}
    
    validates :quantity, numericality: { only_integer: true, :allow_nil => false }
    
    canadian_postal_code = /^([a-zA-Z]\d[a-zA-z]( )?\d[a-zA-Z]\d)$/
    validates :Postalcode, format: { with: canadian_postal_code, :multiline => true}

    canadian_phone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
    validates :Phone, format: { with: canadian_phone, :multiline => true}
    
    validates :Location, :presence => true
    
     
    def Price 
      @SizePrice = 0
      if self.Size == "Small" 
         @SizePrice = 5.00
         
      elsif self.Size == "Medium" 
         @SizePrice = 10.00
         
      elsif self.Size == "Large" 
         @SizePrice = 15.00
         
      elsif self.Size == "Extra Large" 
         @SizePrice = 20.00
      end 
      
      if (attribute_present?('Toppings') && self.Crust == "Stuffed")
         @SizePrice += 2
      end
      
      if attribute_present?('Toppings')
          if(self.Toppings.count(',') > 0)
             @SizePrice += (self.Toppings.count(',') * 0.5)
          end
      end
      
      if(attribute_present?('quantity') && (self.quantity.is_a? Numeric))
          @SizePrice *= self.quantity
      end
      
      $prePrice = @SizePrice
      
      if(attribute_present?('Location'))
          if self.Location == "Manitoba"
              @SizePrice += (@SizePrice * 0.10) 
                $Tax = 0.10
          end
          
          if self.Location == "Ontario"
              @SizePrice += (@SizePrice * 0.13) 
              $Tax = 0.13
          end
          
          if self.Location == "Quebec"
              @SizePrice += (@SizePrice * 0.11) 
              $Tax = 0.11
          end
          
          if self.Location == "Saskatchewan"
              @SizePrice += (@SizePrice * 0.15) 
              $Tax = 0.15
          end
      end
      
      $Tax = $prePrice * $Tax
      
      return @SizePrice
    end 

end
    