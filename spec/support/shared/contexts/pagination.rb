# frozen_string_literal: true

shared_context 'pagination' do
  parameter(
    name: :page,
    in: :query,
    required: false,
    default: 1,
    description: 'Номер страницы'
  )

  parameter(
    name: :items,
    in: :query,
    required: false,
    default: Pagy::DEFAULT[:items],
    description: 'Кол-во элементов отображаемых на странице'
  )
end
