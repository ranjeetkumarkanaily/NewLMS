require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

  describe "GET #students_progress" do
    it "returns http success" do
      get :students_progress
      expect(response).to have_http_status(:success)
    end
  end

end
