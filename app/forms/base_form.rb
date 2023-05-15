# frozen_string_literal: true

class BaseForm
  attr_accessor :object, :params

  def initialize(object, params:, current_user: nil)
    @object = object
    @params = params
    @current_user = current_user
  end

  def require_params(key)
    params[key] ? params.require(key) : params
  end
end
