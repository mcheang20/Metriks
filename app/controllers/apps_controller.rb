class AppsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]

  def index
    @app = App.all
  end

  def show
    @app = App.find(params[:id])
    @events = @app.events.group_by(&:name)
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
      if @app.save
        flash[:notice] = "Application was created succesfully"
        redirect_to apps_path
      else
        flah[:alert] = "Failed to create application plese try again"
        redirect_to new_app_path
      end
    end

  def destroy
    @app = App.find(params[:id])
    if @app.destroy
      flash[:notice] = "Application was deleted succesfully"
      redirect_to apps_path
    else
      flash[:alert] = "There was an error deleting the application"
      redirect_to apps_path
      end
    end


  private

  def app_params
    params.require(:app).permit(:name, :URL, :id)
  end
end
