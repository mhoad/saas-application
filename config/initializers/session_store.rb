# frozen_string_literal: true

options = {
  key: '_saasapplication_session'
}

case Rails.env
when 'development', 'test'
  options[:domain] = 'lvh.me'
when 'production'
  options[:domain] = 'reporting.social'
end

Rails.application.config.session_store :cookie_store, options
