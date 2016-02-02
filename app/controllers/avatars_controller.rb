class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:update, :destroy]
  before_filter :authenticate_user!
  # POST /avatars
  # POST /avatars.json
  def create
    @user = current_user
    if @user.avatar.nil?
      @avatar = @user.create_avatar(avatar_params)

      respond_to do |format|
        if @avatar.save
          format.json { render :show, status: :created, location: @avatar }
        else
          format.json { render json: @avatar.errors, status: :unprocessable_entity }
        end
      end
    else
      return render json: { error: 'У пользователя уже существует аватар' }, status: 403
    end
  end

  # PATCH/PUT /avatars/
  # PATCH/PUT /avatars/.json
  def update
    respond_to do |format|
      if @avatar.update(avatar_params)
        format.json { render :show, status: :ok, location: @avatar }
      else
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatars/
  # DELETE /avatars/.json
  def destroy
    @avatar.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @user = current_user
      @avatar = Avatar.find(@user.avatar)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:avatar).permit(:name, :sex, :head_id, :body_id)
    end
end
