class Section < ApplicationRecord

	belongs_to :page
	has_many :section_edits

scope :visible , lambda {where(:visible => true)}
scope :invisible , lambda {where(:visible => false)}
scope :position , lambda {order ("position ASC")}
scope :newest_first , lambda {order ("created_at DESC")}

end
