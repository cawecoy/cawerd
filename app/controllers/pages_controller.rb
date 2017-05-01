class PagesController < ApplicationController
  before_action :set_page, only: [:show, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.includes(:user)
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # POST /pages
  # POST /pages.json
  def create
    params = page_params
    possible_page = Page.where('user_id IS NOT NULL').where(uid: params[:uid]).order('updated_at DESC').first() # last page associated to some user that has the "uid" param
    
    if(!possible_page.nil?)
      params[:user_id] = possible_page.user_id
    end

    @page = Page.new(params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :url, :access_at, :user_id, :uid)
    end
end
