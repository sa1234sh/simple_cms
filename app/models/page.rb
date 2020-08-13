class Page < ApplicationRecord

belongs_to :subject , { :optional => false}
has_and_belongs_to_many :admin_users

scope :visible , lambda {where(:visible => true)}
scope :invisible , lambda {where(:visible => false)}
scope :position , lambda {order ("position ASC")}
scope :newest_first , lambda {order ("created_at DESC")}

end
