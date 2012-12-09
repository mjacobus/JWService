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
    
  
  # percent of covered apartments  
  def coverage
    total = apartments.length
    covered = apartments.visited.length
    if total > 0
      covered * 100 / total
    else
      0
    end
  end
end
