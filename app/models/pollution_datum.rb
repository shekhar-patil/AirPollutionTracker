class PollutionDatum < ApplicationRecord
  extend ActiveRecord::Import

  belongs_to :city
end
