class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  def match_root_route(options)
    name = has_named_route?(name_for_action(:root, nil)) ? nil : :root
    args = ["/", { as: name, via: :get }.merge!(options)]
  
    match(*args)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

end