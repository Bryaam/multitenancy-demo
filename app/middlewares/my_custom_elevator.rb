require 'apartment/elevators/generic'

class MyCustomElevator < Apartment::Elevators::Generic
  DEFAULT_SCHEMA = 'public'.freeze

  def parse_tenant_name(request)
    warden_user = request.env['rack.session']['warden.user.user.key']
    uid = warden_user.first[0] unless warden_user.nil?

    current_user = User.find_by(id: uid)
    current_user.nil? ? DEFAULT_SCHEMA : current_user.domain
  end
end
