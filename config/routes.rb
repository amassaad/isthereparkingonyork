Rails.application.routes.draw do
  require "sidekiq/web"

  get 'parking/check'

  # You can have the root of your site routed with "root"
  root 'parking#check'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"

end
