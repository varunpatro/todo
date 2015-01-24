class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def login
  end

  def auth
    uname = user_params["username"]
    upass = user_params["password"]

    @users = User.where(username: uname)
    if (@users.count > 0)
      @user = @users.first
      if (@user.password == upass)
        session[:logged_in?] = true
        session[:user] = @user
        session[:user_id] = @user.id
        session[:user_name] = @user.name
        redirect_to lists_path
      else
        redirect_to users_login_path, notice: "Incorrect Password."
      end
    else
      redirect_to users_login_path, notice: "Incorrect Username."
    end
  end

  def signup
  end

  def logout
    reset_session
    redirect_to users_login_path, notice: "You have successfully logged out."
  end

  # GET /users
  # GET /users.json
  def index
    # redirect to edit user's information page
    @user = User.find(session[:user_id])
    redirect_to edit_user_path(@user)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # should not visit this page but if it does then redirect to users's lists
    redirect_to lists_path
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @user.id != session[:user_id]
      redirect_to users_path, notice: "You can't edit someone else's profile. Please edit your own."
    end
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)

    # if (user_params["password"] != params[:repass])
    #   respond_to do |format|
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    #   return
    # end

    respond_to do |format|
      if @user.save
        format.html { redirect_to lists_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end
end
