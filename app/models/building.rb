class Building < ActiveRecord::Base
  belongs_to :territory
  has_many :apartments
  
  validates :address, 
    :presence => true,
    :uniqueness => {:case_sensitive => false, :scope => :number}
  
  validates :number,
    :presence => true
    
  validates :territory,
    :presence => true  
    
end
