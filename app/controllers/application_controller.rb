# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiErrors
  # TODO: Тут вероятней всего мы должны будем получать каким-то образом текущего пользователя из Auth Service
end
