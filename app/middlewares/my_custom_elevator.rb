require 'apartment/elevators/generic'

class MyCustomElevator < Apartment::Elevators::Generic
  DEFAULT_SCHEMA = 'public'.freeze

  def parse_tenant_name(request)
    current_user = User.find_by(id: warden_user_id(request))
    current_user.nil? ? DEFAULT_SCHEMA : current_user.domain
  end

  protected

  def warden_user_id(request)
    warden_user = request.env['rack.session']['warden.user.user.key']
    warden_user.first[0] unless warden_user.nil?
  end
end
