module ApplicationHelper
  
  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(:data => { :confirm => 'Are you sure?' }, :method => :delete, :class => "btn btn-mini btn-danger")
    link_to 'delete', url, html_options
  end
  
  def gravatar_tag(email, options = {})
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=#{options[:size]}", options
  end
  
end
