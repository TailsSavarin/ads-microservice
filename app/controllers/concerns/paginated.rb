# frozen_string_literal: true

module Paginated
  include Pagy::Backend
  extend ActiveSupport::Concern

  included { after_action :set_pagination_headers }

  private

  def set_pagination_headers
    pagy_headers_merge(@pagy) if @pagy
  end
end
