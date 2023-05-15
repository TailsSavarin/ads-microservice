# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s
  config.swagger_docs = YAML.safe_load(
    Rails.root.join('spec/swagger_docs.yml').read
  )&.with_indifferent_access

  config.swagger_format = :yaml
  config.swagger_dry_run = false

  config.after type: :request do |example|
    example.metadata[:response][:content] = {
      'application/json' => { example: response_json },
      'text/json' => { example: response_json }
    }
  end
end
