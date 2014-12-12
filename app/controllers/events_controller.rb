class EventsController < ApplicationController
  before_action :set_match, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
    @event.players.build
  end

  def create
    @event = Event.new(event_params)
    @event.posX = params[:event][:pos_x]
    @event.posY = params[:event][:pos_y]
    @event.match = @match
    raise
    if @event.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def event_params
    params.require(:event).permit(:category, :time, :ratio, :player_ids => [])
  end

end