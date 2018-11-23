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
      @user.update_attributes(user_params)
      if @user.update_attributes(user_params)
        redirect_to admin_user_path, :notice  => "Successfully updated user."
      else
        error_msg = @user.errors.full_messages[0]
        redirect_to edit_admin_user_path, :notice => error_msg
      end
    end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end

  end
end
