# frozen_string_literal: true

class Ad < ApplicationRecord
  PRESENCES = %i[title description city user_id].freeze

  validates(*PRESENCES, presence: true)
end
