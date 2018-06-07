class PairCandlesController < ApplicationController
  def index
    current_cundle =  PairCandle.where(:pair_id => params[:pair_id])
    if current_cundle.empty?
    PairCandlesService.pairs_first_init params[:pair_id]
    else
     time = current_cundle.order(:created_at).last.created_at.to_datetime
     if time.strftime("%B %d, %Y") < DateTime.now.strftime("%B %d, %Y")
       current_cundle.each{|pair|pair.destroy}
       PairCandlesService.pairs_first_init params[:pair_id]
     end
      end
    @pair = Pair.find(params[:pair_id])
    @pairs = current_cundle
    @data = PairCandlesService.graph_data @pairs
  end
end
