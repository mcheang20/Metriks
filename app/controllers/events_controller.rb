class EventsController < ApplicationController

  def show
     @event = Event.find(params[:id])
  end

  def new
    @app = App.find(params[:app_id])
    @event = Event.new
  end

  def create
    @app = App.find(params[:app_id])
    @event = @app.events.build(event_params)

    if @event.save
       flash[:notice] = "Event was saved."
       redirect_to [@app, @event]
    else
      flash.now[:alert] = "There was an error creating the event. Please try again"
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end

end
