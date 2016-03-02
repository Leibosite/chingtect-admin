class Permission < ActiveRecord::Base
  extend Enumerize
  has_and_belongs_to_many :roles, :join_table => :permissions_roles

  enumerize :action, in: [:manage, :edit, :read, :access]
end
