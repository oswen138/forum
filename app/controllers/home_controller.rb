class HomeController < ApplicationController
  def index
  end

  def board
  end

  def messages
    redirect_to discussion_private_messages_path
  end
end


