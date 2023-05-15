# frozen_string_literal: true

class AdSerializer < Panko::Serializer
  attributes :id, :title, :description, :city, :lat, :lon, :user_id, :created_at, :updated_at
end
