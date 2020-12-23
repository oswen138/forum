module ApplicationHelper
  require 'redcarpet/render_strip'
  include NavigationHelper
  include Private::ConversationsHelper
  include Private::MessagesHelper 
  include Group::ConversationsHelper
  include Group::MessagesHelper

  def has_role?(role)
    current_user && current_user.has_role?(role)
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code,language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def strip_markdown(text)
    markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    markdown_to_plain_text.render(text).html_safe
  end

  def gravatar_for(user, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "border-radius-50")
  end

  def markdown_to_html(text)
    Kramdown::Document.new(text, input: "GFM").to_html
  end

  def private_conversations_windows
    params[:controller] != 'messengers' ? @private_conversations_windows : []
  end

  def group_conversations_windows
    params[:controller] != 'messengers' ? @group_conversations_windows : []
  end
end

