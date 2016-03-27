class NotesController < ApplicationController
  before_action :set_note, only: [:show, :destroy]

  def index
    @notes = Note.limit(9)
  end

  def show
  end

  def new
    @notes = Note.limit(9)
    @count = Note.all.length
    @note = Note.new
    @note.user_id = current_user.id
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to root_path , notice: 'Your note was added to the fridge'}
      else
        format.html { render :new }
      end
    end
  end


  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :user_id)
    end
end
