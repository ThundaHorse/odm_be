require "rails_helper"
require "factory_bot"

# class ApplicationController < ActionController::Base
#   class AccessDenied < StandardError; end
# end

# class ApplicationControllerSubclass < ApplicationController

#   rescue_from ApplicationController::AccessDenied, :with => :access_denied

#   private

#   def access_denied
#     redirect_to '/401.html'
#   end
# end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

RSpec.describe Api::PostsController, type: :controller do
  before(:all) do
    @posts = create(:posts)    
  end

  describe 'routes' do
    it { should route(:get, 'api/posts').to(action: :index) }
    it { should route(:get, 'api/posts/1').to(action: :show, id: 1) }    
    it { should route(:patch, 'api/posts/1').to(action: :update, id: 1) }
  end

  describe 'get index' do 
    it 'should show all posts' do
      # p @posts.description
      expect(@posts.description).to eq("Test")
    end
  end 
end 