module ApplicationHelper
	def markdown(text)
		options = {
			:autolink => true,
			:space_after_headers => true,
			:fenced_code_blocks => true,
			:no_intra_emphasis => true,
			:hard_wrap => true,
			:strikethrough =>true
		}
		markdown = Redcarpet::Markdown.new(HTMLwithCodeRay,options)
		markdown.render(text).html_safe
	end

	def is_admin?
        return !(current_user == nil || current_user.admin == false)
	end

	class HTMLwithCodeRay < Redcarpet::Render::HTML
		def block_code(code, language)
			CodeRay.scan(code, language).div(:tab_width=>2)
		end
	end
end
