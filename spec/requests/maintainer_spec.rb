# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Maintainer' do
  let(:admin) { create(:user, :admin) }
  let(:project) { create(:project, maintainers: maintainer) }
  let(:maintainer) { [] }

  before { login_as admin }

  describe 'Edit maintainer' do
    it 'displays form successfully' do
      get edit_project_maintainers_path(project)

      expect(response).to have_http_status :ok
    end
  end

  describe 'Add maintainer' do
    let(:user) { create(:user) }

    it 'user added successfully' do
      expect { post project_maintainer_connection_path(project, user) }.to change { project.maintainers.count }.by(1)
    end

    it 'redirects correctly' do
      post project_maintainer_connection_path(project, user)

      expect(response).to redirect_to(edit_project_maintainers_path(project))
    end
  end

  describe 'Remove maintainer' do
    let(:user) { create(:user) }
    let(:maintainer) { [user] }

    it 'adds user successfully' do
      expect { delete project_maintainer_connection_path(project, user) }.to change { project.maintainers.count }.by(-1)
    end

    it 'redirects correctly' do
      delete project_maintainer_connection_path(project, user)

      expect(response).to redirect_to(edit_project_maintainers_path(project))
    end
  end
end
