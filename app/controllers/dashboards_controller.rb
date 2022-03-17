# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @bodies_counter = BodiesCounterQuery.new
    @stars_counter_by_category = StarsCounterByCategoryQuery.new
    @closest_candidates =  ClosestCandidatesQuery.new.n_closest_candidates
  end
end
