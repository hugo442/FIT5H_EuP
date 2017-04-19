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
      if params[:verfahren] == "3x3 Schuss"
        @endsummen = {}
        @mitglieder = {}
        @punkte = {}
        @gruppeteiler = {}
        groups = Group.all
        groups.each do |group|
          @marksman = MarksmanGroup.where(group_id: group.id)
          if @marksman.count == 4
            @schuetzenprogruppe = []
            @summe = 0
            @marksman.each do |marksmen|
              @wertarrayeinesschuetzen = []
              @marksmen1 = Marksman.where(:id => marksmen.marksman_id).first
              @zaehler = Event.where(:name => params[:eventname], :marksmen => @marksmen1.startnr)
              if @zaehler.count == 3
                @schuetzenprogruppe << @marksmen1
                @wertegruppe = Event.where(:name => params[:eventname], :marksmen => @marksmen1.startnr)
                @wertegruppe.each do |wert|
                  @summe = @summe + wert.value.to_i
                  @wertarrayeinesschuetzen << wert.value.to_i
                end
              elsif @zaehler.count == 1
                @teiler = Event.where(:name => params[:eventname], :marksmen => @marksmen1.startnr).first.unknown7
                @gruppeteiler[group.id] = Event.where(:name => params[:eventname], :marksmen => @marksmen1.startnr).first
                @schuetzenprogruppe << @marksmen1
              else
                next
              end
              @punkte[@marksmen1.startnr] = @wertarrayeinesschuetzen
            end
            @mitglieder[group.id] = @schuetzenprogruppe
            @endsummen[group.id] = [@summe, @teiler.to_f]
          else
            next
          end
        end
        @endsummen = Hash[@endsummen.sort_by{|k, v| [ v[0], 1/v[1] ]}.reverse]
      elsif params[:verfahren] == "2x5 Schuss"

      elsif params[:verfahren] == "3 Schuss"

      elsif params[:verfahren] == "2x Teiler"
        @eventsall = []
        allmarksman = Marksman.all
        allmarksman.each do |marksmen|
          if Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).count > 0
            @eventsall << Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).order(:unknown7).first
            @eventsall << Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).order(:unknown7).second
          else
            next
          end
        end
        @eventsall
      end
          

  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_method
      @method = [ "3x3 Schuss", "2x5 Schuss", "3 Schuss", "2x Teiler" ]
    end
end
