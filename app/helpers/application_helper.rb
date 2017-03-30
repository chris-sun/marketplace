module ApplicationHelper
  def app_name
    @app_name ||= Figaro.env.APP_NAME
  end

  def avatar_url(user, size=150)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
