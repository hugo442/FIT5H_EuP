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
      lala = nil
      events = Event.where(:name => params[:eventname]).count
      if params[:verfahren] == @method[0] && events > 0
        @endsummen = {}
        @mitglieder = {}
        @punkte = {}
        @groups = Group.all
        @groups.each do |group|
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
                @schuetzenprogruppe << @marksmen1
              else
                next
              end
              @punkte[@marksmen1.startnr] = @wertarrayeinesschuetzen
            end
            @mitglieder[group.id] = @schuetzenprogruppe
            @endsummen[group.id] = [@summe, @teiler]
          else
            next
          end
        end
        @endsummen.each do |k, v|
          if v[0] == nil || v[1] == nil
            params[:verfahren] = "error"
            render 'index'
            lala = 1
            break
          end
        end
        @endsummen = Hash[@endsummen.sort_by{|k, v| [ v[0], 1/v[1] ]}.reverse] if lala == nil
      elsif params[:verfahren] == @method[1] && events > 0
        @endsummen = {}
        @mitglieder = {}
        @punkte = {}
        @groups = Group.all
        @groups.each do |group|
          @marksman = MarksmanGroup.where(group_id: group.id)
          if @marksman.count == 3
            @schuetzenprogruppe = []
            @summe = 0
            @marksman.each do |marksmen|
              @wertarrayeinesschuetzen = []
              @marksmen1 = Marksman.where(:id => marksmen.marksman_id).first
              @zaehler = Event.where(:name => params[:eventname], :marksmen => @marksmen1.startnr)
              if @zaehler.count == 5
                @schuetzenprogruppe << @marksmen1
                @wertegruppe = Event.where(:name => params[:eventname], :marksmen => @marksmen1.startnr)
                @wertegruppe.each do |wert|
                  @summe = @summe + wert.value.to_i
                  @wertarrayeinesschuetzen << wert.value.to_i
                end
              elsif @zaehler.count == 1
                @teiler = Event.where(:name => params[:eventname], :marksmen => @marksmen1.startnr).first.unknown7
                @schuetzenprogruppe << @marksmen1
              else
                next
              end
              @punkte[@marksmen1.startnr] = @wertarrayeinesschuetzen
            end
            @mitglieder[group.id] = @schuetzenprogruppe
            @endsummen[group.id] = [@summe, @teiler]
          else
            next
          end
        end
        @endsummen.each do |k, v|
          if v[0] == nil || v[1] == nil
            params[:verfahren] = "error"
            render 'index'
            lala = 1
            break
          end
        end
        @endsummen = Hash[@endsummen.sort_by{|k, v| [ v[0], 1/v[1] ]}.reverse] if lala == nil
      elsif params[:verfahren] == @method[2] && events > 0
        @endsummen = {}
        @marksman = Marksman.all
        @marksman.each do |marksmen|
          if Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).count > 2
            @summe = 0
            @dreiwerte = Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).order(:time_date).first(3)
            @dreiwerte.each do |event|
              @summe = @summe + event.value.to_i
            end
          else
            next
          end
          if Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).count > 3
            @teiler = Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).order(:time_date).last.unknown7
          else
            @teiler = 0.000001
          end
          @endsummen[marksmen.startnr] = [@summe, @teiler, @dreiwerte]
        end
        @endsummen = Hash[@endsummen.sort_by{|k, v| [ v[0], 1/v[1] ]}.reverse]
      elsif params[:verfahren] == @method[3] && events > 0
        @endsummen = {}
        @marksman = Marksman.all
        @marksman.each do |marksmen|
          if Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).count > 1
            @summe = 0
            @beideteiler = Event.where(:name => params[:eventname], :marksmen => marksmen.startnr).order(:unknown7).first(2)
            @beideteiler.each do |event|
              @summe = @summe + event.unknown7
            end
          else
            next
          end
          @endsummen[marksmen.startnr] = [@summe.round(2), @beideteiler]
          @endsummen = Hash[@endsummen.sort_by{|k, v| v[0] }]
        end
      else
        params[:verfahren] = "error"
      end
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_method
      @method = [ "3x3 Schuss", "2x5 Schuss", "3 Schuss", "2x Teiler" ]
    end
end
