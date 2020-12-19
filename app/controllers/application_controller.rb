class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def index
    if current_user.discussions
      render 'discussions/index'
    else current_user.messages
      render 'messages/index'
  end
end

end
