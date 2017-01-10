module BooksHelper

	def count_likes(book)
		if book.likes.count > 0
			then
			c=0
			book.likes.each do |lala|
				c=c+lala.quality
			end

			e=c/book.likes.count
		else
			"Keine Likes"
		end

	end

end
