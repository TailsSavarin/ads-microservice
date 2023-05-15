# frozen_string_literal: true

Ad.find_or_create_by(title: 'title') do |ad|
  ad.description = 'description'
  ad.city = 'city'
  ad.user_id = 1
end
