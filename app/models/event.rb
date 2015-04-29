class Event < ActiveRecord::Base
	validates_presence_of :name, :message => "Event is blank"
end
