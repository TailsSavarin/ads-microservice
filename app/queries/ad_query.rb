# frozen_string_literal: true

class AdQuery < BaseQuery
  SEARCH_PARAMS = %i[title].freeze
  FILTER_PARAMS = %i[user_id lat lon].freeze

  private

  def search(scope, query)
    search_with_ilike_text(scope, query, 'ads', params_list: SEARCH_PARAMS)
  end

  def filter(scope, params)
    filter_by_params(scope, params, params_list: FILTER_PARAMS)
  end
end
