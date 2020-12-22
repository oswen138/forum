module DiscussionsHelper

  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

  def contact_user_partial_path
    if user_signed_in?
      @discussion.user.id != current_user.id ? 'discussions/show/contact_user' : 'shared/empty_partial'
    else 
      'discussions/show/login_required'
    end
  end

  def leave_message_partial_path
    if @message_has_been_sent
      'posts/show/contact_user/already_in_touch'
    else
      'posts/show/contact_user/message_form'
    end
  end

end
