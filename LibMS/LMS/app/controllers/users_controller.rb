class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show, :index, :destroy]
  before_action :correct_user,   only: [:edit, :update, :show]

  def index
    if (current_user.user_type != "user")
      @users = User.paginate(page: params[:page])
    else
      redirect_to current_user 
    end 
  end
 
  def view_profile
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def admin_index
    if (current_user.user_type != "user")
      @users = User.paginate(page: params[:page])
    else
      redirect_to current_user 
    end 
  end

  def new
    @user = User.new
  end

  def new_admin
    @user = User.new
  end

#Manage book, admin, member 
  def manage_book
  end

  def manage_member
  end

  def manage_admin
  end   

  def create
    @user = User.new(user_params)
    if (@user.email == "superadmin@example.com")
      @user.user_type = "admin"
    end
    if (@user.user_type != "admin")
      @user.user_type = "user"
    end  
    if @user.save
      log_in @user
      flash[:success] = "Welcome to OOLS Library!"
      redirect_to @user
    else
      if(current_user.nil?)
        redirect_to login_url
      elsif (current_user.user_type == "admin")
        render 'new_admin'
      else
        render 'new'
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
    render 'edit'
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "You recently updated the profile"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    #User.find(params[:id]).destroy
    if @user.user_type != "user"
      @user.destroy
      flash[:success] = "Admin deleted"
      redirect_to admins_url
    else
      @user.destroy
      flash[:success] = "Member deleted"
      redirect_to users_url
    end
  end

  private

    def user_params
	params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :password,
                                   :password_confirmation, :phone_number, :address_street, :address_state, :address_housei, :user_type)
    end

    # Checks and confirms logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in to access."
        redirect_to login_url
      end
    end

    # Verifies the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

=begin
  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end
=end

    # Confirms an admin user.
    def admin_user
      if current_user.user_type != "user"
        redirect_to(root_url)
      end
    end

    # Checks and confirms logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in to access."
        redirect_to login_url
      end
    end

    # Verifies the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

=begin
  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end
=end

    # Confirms an admin user.
    def admin_user
      if current_user.user_type != "user"
        redirect_to(root_url)
      end
    end

  def profile
    render 'profile'
  end

end
