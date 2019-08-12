Apartment.configure do |config|
  config.excluded_models = %w{ User }
  config.tenant_names = lambda { User.pluck :domain }
end

Rails.application.config.middleware.insert_before Warden::Manager, MyCustomElevator
