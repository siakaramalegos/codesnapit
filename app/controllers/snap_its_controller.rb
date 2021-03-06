class SnapItsController < ApplicationController

  def index
    @snap_its = current_user.snap_its
  end


  def show
  end


  def new
    @snap_it_languages = SnapItLanguage.all
    @snap_it_themes = SnapItTheme.all
  end


  def create
    @snap_it = SnapIt.new_from_token(snap_it_params[:token])
    if @snap_it.save
      flash[:success] = 'SnapIt created'
      redirect_to snap_its_path
    else
      flash[:error] = 'SnapIt not created: ' +
        @snap_it.errors.full_messages.join(', ')
      redirect_to new_snap_it_path
    end
  end


  def destroy
  end




  private
  def snap_it_params
    params.require(:snap_it).permit(
      :token
    )
  end
end




