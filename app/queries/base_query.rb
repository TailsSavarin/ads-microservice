# frozen_string_literal: true

class BaseQuery
  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(@initial_scope, params[:search])
    scoped = filter(scoped, params)
    sort(scoped, col: params[:sort_col], dir: params[:sort_dir])
  end

  private

  def search(scope, _query)
    scope
  end

  def filter(scope, _)
    scope
  end

  def search_with_ilike_text(scope, query, table_name, params_list: [])
    return scope if query.blank?

    scope.where("#{params_list.map { "#{table_name}.#{_1}" }.join(' ILIKE :q OR ')} ILIKE :q", q: "%#{query}%")
  end

  def filter_by_params(scope, params, params_list: [])
    params_list.each do |param|
      next if params[param].blank?

      scope = scope.where(param => params[param])
    end

    scope
  end

  def sort(scope, col:, dir:)
    return scope unless [col, dir].all?(&:present?)

    scope.order(col => dir)
  end
end
