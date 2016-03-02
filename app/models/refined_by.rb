class RefinedBy < ActiveRecord::Base
  belongs_to :spec
  belongs_to :encodingScheme
  belongs_to :element
end
