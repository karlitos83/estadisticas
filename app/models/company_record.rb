class CompanyRecord < ActiveRecord::Base
belongs_to :industry
has_many :activity, :through => :industry
belongs_to :country
end
