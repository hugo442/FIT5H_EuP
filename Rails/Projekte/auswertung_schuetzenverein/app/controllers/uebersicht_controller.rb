class UebersichtController < ApplicationController
	def index
		@schuetzes = Schuetze.all
	end
end
