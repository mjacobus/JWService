class Apartment < ActiveRecord::Base
  belongs_to :building
  
  validates :number, 
    :presence => true,
    :uniqueness => {:case_sensitive => false, :scope => :building_id}
  
  
  def self.visited
    where(visited: true)
  end
  
  def self.unvisited
    where(visited: false)
  end
  
  def self.to_revisit
    where(revisit: true)
  end
  
  def self.not_to_revisit
    where(revisit: false)
  end
end
