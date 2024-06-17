# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Account' do
  describe 'Navigate' do
    let(:project) { create(:project, maintainers: [user]) }
    let(:user) { create(:user, :admin) }

    before { login_as user }

    context 'when index accounts' do
      it 'display is successful' do
        get project_accounts_path(project)

        expect(response).to have_http_status :ok
      end
    end

    context 'when new account' do
      it 'form display is successful' do
        get new_project_account_path(project)

        expect(response).to have_http_status :ok
      end
    end

    context 'when create account' do
      let(:account) { build(:account) }
      let(:params) do
        { account: account.attributes.merge(services: account.services.join(','), account_manager_ids: [user.id]) }
      end

      it 'successfully creates new account' do
        expect { post project_accounts_path(project), params: params }.to change { Account.count }.by(1)
      end

      it 'successfully redirects to' do
        post project_accounts_path(project), params: params

        expect(response).to redirect_to(project_path(project))
      end
    end

    context 'when edit account' do
      let(:account) { create(:account, project: project) }

      it 'form display is successful' do
        get edit_project_account_path(project, account)

        expect(response).to have_http_status :ok
      end
    end

    context 'when update account' do
      let(:account) { create(:account, project: project) }
      let(:params) { { account: account.attributes.merge(services: account.services.join(','), mfa_supported: true) } }

      it 'successfully updates account' do
        expect { patch project_account_path(project, account), params: params }
          .to change { account.reload.mfa_supported }.to(true)
      end

      it 'successfully redirects to' do
        patch project_account_path(project, account), params: params

        expect(response).to redirect_to project_accounts_path(project)
      end
    end

    context 'when destroy account' do
      let(:account) { create(:account, project: project) }

      it 'successfully destroys new account' do
        account
        expect { delete project_account_path(project, account) }
          .to change { project.accounts.count }.by(-1)
      end

      it 'successfully redirects to' do
        delete project_account_path(project, account)

        expect(response).to redirect_to(project_accounts_path(project))
      end
    end
  end
end
