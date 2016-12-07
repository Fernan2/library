class AuthorDecorator < Draper::Decorator
  delegate_all

  def title
    h.content_tag(:h1, [first_name, last_name.upcase].join(' '))
  end
end
