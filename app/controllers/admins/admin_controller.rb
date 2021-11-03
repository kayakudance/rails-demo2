class Admins::AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  def index
  end
end
