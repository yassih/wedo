class CalendarController < ApplicationController
  def index
  	@lists = List.all
  end
end
