class Page < ApplicationRecord

belongs_to :subject , { :optional => false}
has_and_belongs_to_many :admin_users
has_many :sections

scope :visible , lambda {where(:visible => true)}
scope :invisible , lambda {where(:visible => false)}
scope :position , lambda {order ("position ASC")}
scope :newest_first , lambda {order ("created_at DESC")}

validates_presence_of :name
validates_length_of :name , :maximum => 255
validates_presence_of :parmalink
validates_length_of :parmalink , :maximum => 40
#validates_uniqueness_of :parmalink

end
