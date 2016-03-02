class Post < ActiveRecord::Base
  has_paper_trail
  belongs_to :member
  default_scope{
    members = Member.where("tenant_id = ?", Thread.current[:tenant_id]).ids
    where("member_id in (?)",members)
  }
end
