module ApplicationHelper
	def btn_name(event)
		if event.status==true
			return "undo"
		end
		else
			return "done"	
	end
	def finish(event)
		if event.status==true
			return "done"
		end
		else
			return "undo"	
	end
end
