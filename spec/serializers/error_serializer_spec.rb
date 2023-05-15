# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ErrorSerializer do
  let(:ad) do
    ad = build(:ad, title: nil)
    ad.valid?
    ad
  end

  it 'serialize as hash' do
    expect(Oj.load(described_class.new.serialize_to_json(ad.errors))).to eq(
      { full_messages: ad.errors.full_messages, messages: ad.errors.messages }.deep_stringify_keys
    )
  end
end
