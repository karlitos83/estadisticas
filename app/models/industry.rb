class Industry < ActiveRecord::Base
belongs_to :activity
has_many :company_records
end
