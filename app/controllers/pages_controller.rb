class PagesController < ApplicationController
	def show
		 render template: "pages/#{params[:page]}"
		if current_user.try(:just_signed_in?)
                 sys_request = "sudo sh /home/pi/e-mobility/authorize_user.sh " + request.remote_ip + " &"
                  system(sys_request)
                  current_user.update_attribute :just_signed_in, false
		end
	end

end
