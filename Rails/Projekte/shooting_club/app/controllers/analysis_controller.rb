class AnalysisController < ApplicationController
	before_action :set_method

  	def index
  		@wrongdata = Event.where( :marksmen => 0 )
  		unless @wrongdata.count > 0
  			redirect_to analysis_select_path
  		end
  	end

  	def select
  		@events = Event.group(:name)
  	end

  	def calculate
  		@eventsall = Event.all

  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_method
      @method = [ "Firmenpokal", "Gästekönig", "Juniorenkönig", "Er und Sie", "Adjudantenpokal", "König der Könige", "Juniorenpokal", "Bestschütze", "leer" ]
    end
end
