class HomeController < ApplicationController
  protect_from_forgery except: :turbolinks

  def index
  end

  def login
    @session = Session.new
  end

  def turbolinks
     send_file(Turbolinks::Source.asset_path + '/turbolinks.js')
  end
end
