# frozen_string_literal: true

I18n.available_locales = :ru
I18n.default_locale = :ru
I18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml')]
