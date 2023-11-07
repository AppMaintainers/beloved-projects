# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = policy_scope Project
  end
end
