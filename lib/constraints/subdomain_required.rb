# frozen_string_literal: true

# This is where we set the URL constraints that intercept any subdomains that
# are anything besides www. They are then used in the routes.rb file
class SubdomainRequired
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end
