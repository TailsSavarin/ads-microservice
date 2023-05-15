# frozen_string_literal: true

class AdForm < BaseForm
  def save
    object.update(ad_params)
    # TODO: Отправляем запрос в Geocoder Service с параметром object.city если object.valid?
    object.errors.blank?
  end

  private

  def ad_params
    require_params(:ad).permit(
      :title,
      :description,
      :city,
      :user_id
    )
  end
end
