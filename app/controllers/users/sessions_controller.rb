class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     super
	current_user.update_attribute :just_signed_in, true
   end
  
 
  # DELETE /resource/sign_out
   def destroy
     super
     sys_request = "sudo sh /home/pi/e-mobility/block_user.sh " + request.remote_ip + " &"
     system(sys_request)
   end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
