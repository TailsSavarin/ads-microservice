# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe AdsController do
  path '/' do
    get 'Получить список объявлений' do
      tags 'Объявление'
      produces 'application/json'
      include_context 'pagination'

      parameter(
        name: :user_id,
        in: :query,
        type: :integer,
        required: false,
        description: 'ID пользователя'
      )

      parameter(
        name: :lat,
        in: :query,
        type: :integer,
        required: false,
        description: 'Широта'
      )

      parameter(
        name: :lon,
        in: :query,
        type: :string,
        required: false,
        description: 'Долгота'
      )

      parameter(
        name: :sort_dir,
        in: :query,
        required: false,
        type: :string,
        default: nil,
        enum: %i[asc desc],
        description: 'Направление сортировки: asc, desc'
      )

      parameter(
        name: :sort_col,
        in: :query,
        required: false,
        default: nil,
        type: :string,
        enum: %i[created_at updated_at],
        description: 'Название поля для сортировки: created_at, updated_at'
      )

      response 200, 'Список объявлений получен' do
        it_behaves_like 'pagination in headers'

        before { create(:ad) }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body.size).to eq(1)
        end
      end
    end

    path '/create' do
      post 'Создать объявление' do
        tags 'Объявление'
        consumes 'application/json'
        produces 'application/json'

        parameter(
          name: :ad,
          in: :body,
          schema: { '$ref': '#/components/schemas/ad' }
        )

        response 201, 'Объявление создано' do
          let(:ad) do
            {
              title: 'title',
              description: 'description',
              city: 'city',
              user_id: 1
            }
          end

          run_test! do
            body = JSON.parse(response.body, symbolize_names: true)
            expect(body[:title]).to eq(ad[:title])
          end
        end

        response 422, 'Ошибка при создании объявления' do
          let(:ad) { { title: nil } }

          run_test! do
            body = JSON.parse(response.body, symbolize_names: true)
            expect(body[:full_messages]).to be_present
          end
        end
      end
    end
  end
end
