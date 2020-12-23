class HomeController < ApplicationController
  def index
  end

  def board
  end

  def messages
    private
    redirect_to messages_controller_path
  end
end


