class ApplicationController < ActionController::Base
  def hello
    render html: 'sample_app blank page'
  end
end
