class EventsController < ApplicationController
	def index
		@events=Event.all
		if params[:status1].present?
			@events=@events.where(:status => false)
		end
		if params[:status2].present?
			@events=@events.where(:status => true)
		end
	end
	def new
		@event=Event.new
	end
	def create
		@event = Event.new(event_params)
		@event.update_attribute(:status, false)
  		if @event.save
		redirect_to root_path
		else 
		render:new
		end
	end
	def edit
  		@event = Event.find(params[:id])
	end
	def update
		@event = Event.find(params[:id])
  	if @event.update(event_params)
		redirect_to root_path
	else 
		render:update
	end
	end
	def destroy
		@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to root_path
	end
	def complete
		@event = Event.find(params[:id])
		if @event.status == false
			@event.update_attribute(:status,true)
			flash[:notice] = "#{@event.name}完成"
			redirect_to root_path
		else 
			@event.update_attribute(:status, false)
			flash[:notice] = "#{@event.name}未完成"
			redirect_to root_path
		end
	end

	private
	def event_params
  	params.require(:event).permit(:name,:status)
	end
end
