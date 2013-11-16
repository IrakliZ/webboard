module ApplicationHelper
	def page_title(sub_title)
		main_title = "Webboard"
		if sub_title.empty?
			main_title
		else
			"#{main_title} | #{sub_title}"
		end
	end
end
