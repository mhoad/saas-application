# frozen_string_literal: true

module Accounts
  class BaseController < ApplicationController
    before_action :authenticate_user!
  end
end
