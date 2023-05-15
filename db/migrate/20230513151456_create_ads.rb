# frozen_string_literal: true

class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.string :title, null: false, comment: 'Название'
      t.text :description, null: false, comment: 'Описание'
      t.string :city, null: false, comment: 'Название города'
      t.bigint :user_id, null: false, comment: 'ID Пользователя'
      t.float :lat, comment: 'Широта'
      t.float :lon, comment: 'Долгота'

      t.timestamps
    end
  end
end
