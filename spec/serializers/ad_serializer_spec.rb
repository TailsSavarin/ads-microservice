# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdSerializer do
  let(:ad) { build(:ad) }

  it 'serialize as hash' do
    expect(Oj.load(described_class.new.serialize_to_json(ad))).to include(ad.attributes)
  end
end
