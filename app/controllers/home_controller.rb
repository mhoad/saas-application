# frozen_string_literal: true

# This controller is for handling the homepage when a user
# is not currently signed in
class HomeController < ApplicationController
  def index; end

  def health_check
    render plain: 'OK'
  end
end
