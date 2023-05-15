# frozen_string_literal: true

RSpec.describe AdQuery do
  subject(:query) { described_class.new(Ad.all).call(params) }

  before_all do
    create(:ad, title: 'first_title', lat: 1, lon: 1, user_id: 1)
    create(:ad, title: 'second_title', lat: 2, lon: 2, user_id: 2)
  end

  context 'search' do
    let(:params) { { search: 'first' } }

    it 'returns one record' do
      expect(query.size).to eq(1)
    end

    it 'searches needed ad' do
      expect(query[0][:title]).to eq('first_title')
    end
  end

  context 'filter' do
    context 'by user_id' do
      let(:params) { { user_id: 1 } }

      it 'returns one record' do
        expect(query.size).to eq(1)
      end

      it 'filters needed ad' do
        expect(query[0][:user_id]).to eq(1)
      end
    end

    context 'by lat' do
      let(:params) { { lat: 1 } }

      it 'returns one record' do
        expect(query.size).to eq(1)
      end

      it 'filters needed ad' do
        expect(query[0][:lat]).to eq(1)
      end
    end

    context 'by lon' do
      let(:params) { { lat: 1 } }

      it 'returns one record' do
        expect(query.size).to eq(1)
      end

      it 'filters needed ad' do
        expect(query[0][:lon]).to eq(1)
      end
    end
  end

  context 'sort' do
    let(:params) { { sort_col: :user_id, sort_dir: :asc } }

    it 'sorts correctly' do
      expect(query.pluck(:user_id)).to eq([1, 2])
    end
  end
end
