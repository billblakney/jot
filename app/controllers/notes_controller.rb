class NotesController < ApplicationController

  def index
   if params[:search_by_string] && params[:search_by_string] != ""
     @notes = Note.where("text ilike ?", "%#{params[:search_by_string]}%")
   else
     @notes = Note.all
   end
   @notes = @notes.order('notes.display_at DESC').page(params[:page]).per(25)
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
    now_time = Time.now.to_i
    now_time = Time.at(now_time - (now_time % 1.minutes))
    @note.display_at = now_time
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to action: 'index'
    else
      render :new, status: unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      if params[:note][:preview].to_i == 1
        redirect_to @note
      else
        redirect_to root_path, status: :see_other
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def note_params
    params.require(:note).permit(:text, :detail, :display_at)
  end

end
