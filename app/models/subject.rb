class Subject < ApplicationRecord

	has_one :page

scope :visible , lambda  {where(:visible => true)}
scope :invisible , lambda {where(:visible => false)}
scope :sorted , lambda {order("position ASC")}
scope :newest , lambda {order("created_at DESC")}
scope :search , lambda {|querry| where("name LIKE ?", "%#{querry}%")}

validates_presence_of :name
validates_length_of :name, :maximum => 255

end
