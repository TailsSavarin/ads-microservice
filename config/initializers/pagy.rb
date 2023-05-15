# frozen_string_literal: true

require 'pagy/extras/items'
require 'pagy/extras/headers'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:overflow] = :empty_page
Pagy::DEFAULT.freeze
