# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = if params[:all] == 'true'
                  policy_scope(Project)
                else
                  policy_scope(current_user.projects)
                end
                  .order(Arel.sql('projects.deactivated_at IS NULL DESC'))
  end
end
