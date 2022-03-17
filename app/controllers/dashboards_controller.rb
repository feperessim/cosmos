# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @bodies_counter = BodiesCounterQuery.new
  end
end
