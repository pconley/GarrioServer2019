module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def update
      @user = User.find(params[:id])
      user_values = user_params
      if user_values['password'].blank?
        # we do not require the password to be present.
        # but we do not set a blank password which would
        # fail the update attributes
        user_values.delete('password')
      end
      if @user.update_attributes(user_values)
        redirect_to admin_user_path, :notice  => "Successfully updated user."
      else
        error_msg = @user.errors.full_messages[0]
        redirect_to edit_admin_user_path, :notice => error_msg
      end
    end

  private

    def user_params
      ud = UserDashboard.new
      params.require(:user).permit(ud.form_attributes)
    end

  end
end
