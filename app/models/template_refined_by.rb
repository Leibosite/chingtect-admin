class TemplateRefinedBy < ActiveRecord::Base
  belongs_to :templateElementCategory
  belongs_to :templateEncodingScheme
  belongs_to :templateElement
end
