module ApplicationHelper
  def simple_format_with_links(text)
    simple_format(sanitize(Rinku.auto_link(text, :all, 'target="_blank"'),
                           attributes: ['href', 'target']),
                  {class: "auto-#{@detector.direction(text)}"},
                  sanitize: false )
  end
end
