module ApplicationHelper

  @@markdown_render = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true))

  def markdown(text)
    @@markdown_render.render(text).html_safe
  end

end
