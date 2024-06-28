# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Link' do
  let(:project) { create(:project) }
  let(:user) { create(:user, :admin) }

  before { login_as user }

  describe 'Index links' do
    it 'display is successful' do
      get project_links_path(project)

      expect(response).to have_http_status :ok
    end
  end

  describe 'New link' do
    it 'form display is successful' do
      get new_project_link_path(project)

      expect(response).to have_http_status :ok
    end
  end

  describe 'Create link' do
    let(:params) { { link: build(:link).attributes } }

    it 'successfully creates new link' do
      expect { post project_links_path(project), params: params }.to change { Link.count }.by(1)
    end

    it 'successfully redirects to' do
      post project_links_path(project), params: params

      expect(response).to redirect_to(project_path(project))
    end
  end

  describe 'Edit link' do
    let(:link) { create(:link, project: project) }

    it 'form display is successful' do
      get edit_project_link_path(project, link)

      expect(response).to have_http_status :ok
    end
  end

  describe 'Update link' do
    let(:link) { create(:link, project: project) }
    let(:params) { { link: link.attributes.merge(title: 'Updated title') } }

    it 'successfully updates link' do
      expect { patch project_link_path(project, link), params: params }
        .to change { link.reload.title }.to('Updated title')
    end

    it 'successfully redirects to' do
      patch project_link_path(project, link), params: params

      expect(response).to redirect_to project_links_path(project)
    end
  end

  describe 'Destroy link' do
    let(:link) { create(:link, project: project) }

    it 'successfully destroys new link' do
      link
      expect { delete project_link_path(project, link) }
        .to change { project.links.count }.by(-1)
    end

    it 'successfully redirects to' do
      delete project_link_path(project, link)

      expect(response).to redirect_to(project_links_path(project))
    end
  end
end
