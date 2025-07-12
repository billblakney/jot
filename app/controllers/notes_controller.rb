class NotesController < ApplicationController

  def index
    # Was anything present in the search box?
    has_search_str = params[:search_string] && params[:search_string] != ""

    # Did we reach this method via submission of the search form?
    is_submit = params[:is_submit] != nil

    if is_submit
      if has_search_str
        #save the search string on search submit
        session[:search_string] = params[:search_string]
      else
        #clear the search string on search submit
        session[:search_string] = nil
      end
    else
      #was not a search submit so leave search string as-is
    end

    search_string = session[:search_string]

    if search_string != nil
       @notes = Note.where("text ilike ?", "%#{search_string}%")
    else
       @notes = Note.all
    end

    @notes = @notes.order('notes.pin DESC','notes.display_at DESC').page(params[:page]).per(25)
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

  def toggle_pin
    @note = Note.find(params[:id])
    @note.update(pin: !@note.pin)
 
    # Would need some work to setp partial updates using turbo stream
    #respond_to do |format|
    #  format.html { redirect_to notes_path, notice: 'Pin status updated successfully.' }
    #  format.turbo_stream { render turbo_stream: turbo_stream.replace(@note, partial: 'notes/note', locals: { note: @note }) }
    #end

    redirect_to action: 'index'
  end

  private

  def note_params
    params.require(:note).permit(:text, :detail, :pin, :display_at)
  end

end
