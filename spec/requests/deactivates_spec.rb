# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deactivates' do
  describe 'deactivate user' do
    let(:user) { create(:user, admin: admin) }
    let(:admin) { true }

    let(:user_to_be_deactivated) { create(:user) }

    before do
      login_as user
    end

    it 'deactivates the user' do
      expect { delete user_deactivate_path(user_to_be_deactivated) }
        .to change { user_to_be_deactivated.reload.deactivated_at }
        .from(nil)
        .to(be_present)
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
end
