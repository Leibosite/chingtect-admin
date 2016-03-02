def my_user_name
    self.email # or a string "My super car..."
end

def my_member_name
  self.first_name
end

def my_permission_name
  self.description
end

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'Post', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    import
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  # Optional:
  # Configure global RailsAdminImport options
  config.configure_with(:import) do |config|
    config.logging = true
  end

  config.model 'Spec' do
    parent SpecCategory
  end

  config.model 'Element' do
    parent Spec
  end

  config.model 'EncodingScheme' do
    parent Spec
  end

  config.model 'RefinedBy' do
    parent Spec
  end

  config.model 'TemplateElement' do
    parent TemplateElementCategory
  end

  config.model 'TemplateEncodingScheme' do
    parent TemplateElementCategory
  end

  config.model 'TemplateRefinedBy' do
    parent TemplateElementCategory
  end

  config.model 'Character' do
    visible false
  end

  config.model 'ElementAttribute' do
    visible false
  end

  config.model 'Post' do
    edit do
      field :title
      field :member
      field :description, :froala do
        config_options do
          {
            imageUploadParam: 'asset',
            imageUploadURL: '/uploads/create',
            imageDeleteURL: '/uploads/destroy'
          }
        end
      end
    end
    import do
      include_all_fields
      exclude_fields :secret_token
    end
  end

  config.model 'Version' do
    navigation_label '权限管理'
    navigation_icon 'icon-edit'
  end

  config.model 'Role' do
    navigation_label '权限管理'
    navigation_icon 'icon-flag'
  end

  config.model 'Tenant' do
    navigation_label '权限管理'
    navigation_icon 'icon-list'
  end

  config.model 'Permission' do
    object_label_method :my_permission_name
    navigation_label '权限管理'
    navigation_icon 'icon-align-center'
  end

  config.model 'Member' do
    object_label_method :my_member_name
    navigation_label '权限管理'
    navigation_icon 'icon-user'
    list do
      field :id
      field :first_name
      field :last_name
      field :tenant
      field :roles
      field :user
      #do
      #  pretty_value do
      #  value.try(:email)
      #  end
      #end
    end
  end

  config.model  'User' do
    object_label_method :my_user_name
    navigation_label '权限管理'
    navigation_icon 'icon-eye-open'
    list do
      field :id
      field :email
      field :tenants
      field :sign_in_count
      field :current_sign_in_at
    end
    edit do
      field :email
      field :tenants
      field :password
    end
  end

end
