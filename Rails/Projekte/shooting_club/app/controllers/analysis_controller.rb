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
  		#@eventsall = Event.where( :name => params[:eventname] )

      if params[:verfahren] == "3x3 Schuss"
        @allgroupserg = []
        groups = Group.all
        groups.each do |group|
          @marksman = MarksmanGroup.where(group_id: group.id)
          @wertegruppe = []
          @marksman.each do |marksmen|
            @werte = []
            if Event.where( :name => params[:eventname] && :marksmen => marksmen.startnr ).count == 3
              @werte << Event.where( :name => params[:eventname] && :marksmen => marksmen.startnr )
            elsif Event.where( :name => params[:eventname] && :marksmen => marksmen.startnr ).count == 1
              @teiler << Event.where( :name => params[:eventname] && :marksmen => marksmen.startnr )
            end
          end
        end

      elsif params[:verfahren] == "2x5 Schuss"

      elsif params[:verfahren] == "3 Schuss"

      elsif params[:verfahren] == "2x Teiler"

      end
          

  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_method
      @method = [ "3x3 Schuss", "2x5 Schuss", "3 Schuss", "2x Teiler" ]
    end
end
