class SharedListsController < ApplicationController
  # before_action :set_shared_list, only: [:share_the_list]

  # GET /shared_lists
  # GET /shared_lists.json
  def index
    @shared_lists = SharedList.all
  end

  def new
  end

  

  def share_the_list
    @shared_list = SharedList.new
    @list = List.find(params[:list_id])
    @user = User.find(current_user.id)
    @shared_list.user_id = @user.id
    @shared_list.list_id = @list.id
    @friends = @user.active_friends
  end


  # POST /shared_lists
  # POST /shared_lists.json
  def create
    @shared_list = SharedList.new(shared_list_params)

    respond_to do |format|
      if @shared_list.save
        format.html { redirect_to root_path, notice: 'Your list was shared' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /shared_lists/1
  # PATCH/PUT /shared_lists/1.json
  def update
    respond_to do |format|
      if @shared_list.update(shared_list_params)
        format.html { redirect_to @shared_list, notice: 'Shared list was successfully updated.' }
        format.json { render :show, status: :ok, location: @shared_list }
      else
        format.html { render :edit }
        format.json { render json: @shared_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_lists/1
  # DELETE /shared_lists/1.json
  def destroy
    @shared_list.destroy
    respond_to do |format|
      format.html { redirect_to shared_lists_url, notice: 'Shared list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_list
      @shared_list = SharedList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shared_list_params
      params.require(:shared_list).permit(:user_id, :friend_id, :list_id)
    end
end
