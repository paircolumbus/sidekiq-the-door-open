require 'sidekiq'

class GarageDoorOpener
  include Sidekiq::Worker

  def perform()
  end
end
