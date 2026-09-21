class Admin::BaseController < ApplicationController
  before_action :require_authenticated_user
  before_action :require_admin_user
end