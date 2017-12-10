class StaticController < ApplicationController
  skip_before_action :authenticate_request
  def home

  end

  def about

  end
end
