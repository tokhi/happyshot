class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # http://stackoverflow.com/questions/3836462/rails-3-form-helpers-utf8-and-other-hidden-fields
  utf8_enforcer_workaround
end
