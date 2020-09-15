module ApplicationHelper
  def avatar_for_cook(cook, options = { height: 80} )
    height = options[:height]
    avatar_url = "https://avatars.dicebear.com/api/avataaars/#{cook.cook_name}.svg"
    image_tag(avatar_url, alt: cook.cook_name)
  end
end
