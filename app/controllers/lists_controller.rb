class ListsController < ApplicationController
  before_action :valid_auth
  before_action :set_list, only: [:show, :edit, :update, :destroy]


  # GET /lists
  # GET /lists.json
  def index
    @lists = List.where(user_id: @user.id)
    @list = List.new
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @task = Task.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user_id = @user.id

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, notice: "List " + list_params["name"] + ' was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to lists_path, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
      if @list.user_id != @user.id
        redirect_to lists_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name)
    end

    def valid_auth
      if session[:logged_in?]
        @user = User.find(session[:user_id])
      else
        redirect_to users_login_path, notice: "You must login to access your lists."
      end
    end
end
