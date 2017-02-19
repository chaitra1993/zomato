class RegistrationsController < Devise::RegistrationsController

  private

	def sign_up_params
		params[:user].permit(:first_name, :last_name, :mobile, :email, :password, :password_confirmation)
	end
end