# frozen_string_literal: true

RSpec.describe AdForm do
  subject(:form) { described_class.new(Ad.new, params:) }

  context 'valid parameters' do
    let(:params) do
      ActionController::Parameters.new(
        {
          title: 'title',
          description: 'description',
          city: 'city',
          user_id: 1
        }
      )
    end

    it 'creates a new ad' do
      expect { form.save }.to change(Ad, :count).from(0).to(1)
    end
  end

  context 'invalid parameters' do
    let(:params) do
      ActionController::Parameters.new(
        {
          title: nil,
          description: 'description',
          city: 'city',
          user_id: 1
        }
      )
    end

    it 'does not create ad' do
      expect { form.save }.not_to change(Ad, :count)
    end
  end
end
