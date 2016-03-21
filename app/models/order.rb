class Order < ActiveRecord::Base
    before_save do
        self.Toppings.gsub!(/[\[\]\"]/, "") if attribute_present?('Toppings')
    end
    
    validates :Size, presence: true
end
    