class Section < ApplicationRecord

belongs_to :page

scope :visible , lambda {where(:visible => true)}
scope :invisible , lambda {where(:visible => false)}
scope :position , lambda {order ("position ASC")}
scope :newest_first , lambda {order ("created_at DESC")}

CONTENT_TYPE = ['text', 'HTML']

validates_presence_of :name
validates_length_of :name , :maximum => 255
#validates_inclustion_of :content_type, :in => ['text', 'HTML'], :message => "must be one of: #{CONTENT_TYPE.join(',')}"
validates_presence_of :content
end
