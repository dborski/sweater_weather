class ApplicationController < ActionController::Base
  include ServicesHelper
  protect_from_forgery prepend: true
end
