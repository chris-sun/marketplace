module ApplicationHelper
  def app_name
    @app_name ||= Rails.application.class.to_s.split(':').first
  end
end