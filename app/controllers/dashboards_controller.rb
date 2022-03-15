# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @bodies_counter = CounterQuery.new
  end
end
