# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Project' do
  describe 'New project' do
    let(:params) { { project: build(:project).attributes } }
    let(:user) { create(:user) }

    before { login_as user }

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
    end

    context 'when create fails' do
      let(:params) { { title: '' } }

      it 'doesn\'t add a new project' do
        expect { post projects_path, params: params }
          .not_to change { Project.count }.from(0)
      end
    end
  end
end
