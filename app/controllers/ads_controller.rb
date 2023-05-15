# frozen_string_literal: true

class AdsController < ApplicationController
  include Paginated

  def index
    @pagy, ads = pagy(AdQuery.new(Ad.all).call(params))
    render json: Panko::ArraySerializer.new(ads, each_serializer: AdSerializer).to_json
  end

  def create
    form = AdForm.new(Ad.new, params:)
    if form.save
      render json: AdSerializer.new.serialize_to_json(form.object), status: :created
    else
      render_error(form.object.errors)
    end
  end
end
