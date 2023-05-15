# frozen_string_literal: true

FactoryBot.define do
  factory :ad do
    title { 'title' }
    description { 'description' }
    city { 'city' }
    user_id { 1 }
  end
end
