class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @pages = Page.where(user_id: @user.id)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params.except(:uid, :url))

    respond_to do |format|
      if @user.save
        last_page = Page.where(url: user_params[:url]).where(uid: user_params[:uid]).order('updated_at DESC').first()
        if(!last_page.nil?)
          last_page.update(user_id: @user.id)
        end

        Page.where('user_id IS NULL').where(uid: user_params[:uid]).update_all(user_id: @user.id)

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
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
      params.require(:user).permit(:name, :email, :uid, :url)
    end
end
