# frozen_string_literal: true

RSpec.describe Ad do
  describe 'validations' do
    described_class::PRESENCES.each do |field|
      it { is_expected.to validate_presence_of(field) }
    end
  end
end
