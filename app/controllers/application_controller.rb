class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :shortly

	include PagesHelper
	include SessionsHelper
	include UsersHelper

	private

		def shortly
			@short = Shortly::Clients::Tinyurl
		end
end