class Apartment < ActiveRecord::Base
  belongs_to :building
  
  validates :number, 
    :presence => true,
    :uniqueness => {:case_sensitive => false, :scope => :building_id}
    
end
