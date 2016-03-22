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
end
    