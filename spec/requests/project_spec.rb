# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Project' do
  let(:user) { create(:user, admin: admin) }
  let(:admin) { true }

  before { login_as user }

  describe 'Show project' do
    let(:project) { create(:project) }

    it 'displays correcly' do
      get project_path(project)

      expect(response).to have_http_status :ok
    end
  end

  describe 'New project' do
    it 'display form correctly' do
      get new_project_path

      expect(response).to have_http_status :ok
    end
  end

  describe 'Create project' do
    let(:params) { { project: build(:project).attributes } }
    let(:admin) { false }

    context 'when creat is successful' do
      it 'adds a new project' do
        expect { post projects_path, params: params }
          .to change { Project.count }.by(1)
      end

      it 'only maintainer is the user' do
        expect { post projects_path, params: params }
          .to change { Project.last }
                .to have_attributes(maintainers: [user])
      end

      it 'redirects correclty' do
        post projects_path, params: params

        expect(response).to redirect_to root_path
      end
    end

    context 'when create fails' do
      let(:params) { { title: '' } }

      it 'doesn\'t add a new project' do
        expect { post projects_path, params: params }
          .not_to change { Project.count }.from(0)
      end

      it 'redirects correclty' do
        post projects_path, params: params

        expect(response).to redirect_to new_project_path
      end
    end
  end

  describe 'Edit project' do
    let(:project) { create(:project) }

    context 'when user is a maintainer on the project' do
      it 'displays form successfully' do
        get edit_project_path(project)

        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'Update project' do
    let(:project) { create(:project) }
    let(:params) { { project: project.attributes.merge(title: 'Updated title') } }

    it 'updates successfully' do
      expect { patch project_path(project), params: params }
        .to change { project.reload.title }.to('Updated title')
    end

    it 'redirects correclty' do
      patch project_path(project), params: params

      expect(response).to redirect_to project_path(project)
    end
  end

  describe 'Deactivate project' do
    let(:project) { create(:project) }

    it 'deactivates the project' do
      expect { delete project_path(project) }
        .to change { project.reload.deactivated_at }
              .from(nil)
              .to(be_present)
              .and(not_change { Project.find_by(id: project.id).id })
    end

    it 'redirects correclty' do
      delete project_path(project)

      expect(response).to redirect_to root_path
    end
  end
end
