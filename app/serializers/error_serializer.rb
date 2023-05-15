# frozen_string_literal: true

class ErrorSerializer < Panko::Serializer
  attributes :messages, :full_messages
end
