class Activity < ActiveRecord::Base
has_many :industries
has_many :company_records, through: :industries
end
