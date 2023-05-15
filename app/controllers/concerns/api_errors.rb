# frozen_string_literal: true

module ApiErrors
  extend ActiveSupport::Concern

  private

  def render_error(errors, status = :unprocessable_entity)
    render json: ErrorSerializer.new.serialize_to_json(errors), status:
  end
end
