class Element < ActiveRecord::Base
  belongs_to :spec
  belongs_to :encodingScheme
end
