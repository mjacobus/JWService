class Building < ActiveRecord::Base
  belongs_to :territory
  
  validates :address, 
    :presence => true,
    :uniqueness => {:case_sensitive => false, :scope => :number}
  
  validates :number,
    :presence => true
    
  validates :territory,
    :presence => true  
    
end
