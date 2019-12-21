require "rails_helper"

class ApplicationController < ActionController::Base
  class AccessDenied < StandardError; end
end

class ApplicationControllerSubclass < ApplicationController

  rescue_from ApplicationController::AccessDenied, :with => :access_denied

  private

  def access_denied
    redirect_to '/401.html'
  end
end

# RSpec.describe ApplicationControllerSubclass do
#   controller(ApplicationControllerSubclass) do
#     def index
#       raise ApplicationController::AccessDenied
#     end
#   end

#   describe "handling AccessDenied exceptions" do
#     it "redirects to the /401.html page" do
#       get :index
#       expect(response).to redirect_to("/401.html")
#     end
#   end
# end

RSpec.describe Api::PostsController, type: :controller do
  describe 'routes' do
    it { should route(:get, 'api/posts').to(action: :index) }
    it { should route(:get, 'api/posts/1').to(action: :show, id: 1) }
    it { should route(:get, 'api/posts/user/1').to(action: :user_posts, id: 1) }
    it { should route(:patch, 'api/posts/1').to(action: :update, id: 1) }
  end
end