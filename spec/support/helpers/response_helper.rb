# frozen_string_literal: true

module ResponseHelper
  def response_json
    @response_json ||= Oj.load response.body
  rescue StandardError
    {}
  end
end
