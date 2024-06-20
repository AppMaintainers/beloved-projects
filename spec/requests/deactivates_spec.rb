# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deactivates' do
  let(:user) { create(:user, admin: admin) }
  let(:admin) { true }
  let(:user_to_be_deactivated) { create(:user) }

  before { login_as user }

  context 'when admin deactivates other user' do
    it 'deactivates the user' do
      expect { delete user_deactivate_path(user_to_be_deactivated) }
        .to change { user_to_be_deactivated.reload.deactivated_at }
              .from(nil)
              .to(be_present)
    end

    it 'redirects correctly' do
      delete user_deactivate_path(user_to_be_deactivated)

      expect(response).to redirect_to users_path
    end

    context 'when the current user is not admin' do
      let(:admin) { false }

      it 'does not deactivate the user' do
        expect { delete user_deactivate_path(user_to_be_deactivated) }
          .not_to change { user_to_be_deactivated.reload.deactivated_at }
                    .from(nil)
      end
    end
  end

  context 'when user deactivates itself' do
    let(:admin) { false }
    let(:user_to_be_deactivated) { user }

    it 'deactivates successfully' do
      expect { delete user_deactivate_path(user_to_be_deactivated) }
        .to change { user_to_be_deactivated.reload.deactivated_at }
              .from(nil)
              .to(be_present)
    end

    it 'redirects correctly' do
      delete user_deactivate_path(user_to_be_deactivated)

      expect(response).to redirect_to users_path
    end
  end
end
