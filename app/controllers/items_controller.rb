class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    # current_user === @user any way, so no need to do current_user = @user ?
    @item = current_user.items.create(item_params)

    # or
    #@item = Item.new(item_params)
    #@item.user = current_user    but need to redirect_to @item.user

    if @item.save
      flash[:notice] = 'Just created a new Item!'
      redirect_to @user
    else
      flash[:notice] = 'Failed to create the Item!'
      redirect_to @user
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id]) #not params[:item_id]
    @item.destroy

    if @item.destroy
      flash[:notice] = 'Item was checked! Will be deleted after 7 days!'
      redirect_to @user
    else
      flash[:notice] = 'Alert! Unable to delete the item!'
      redirect_to @user
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end

  respond_to do |format|
    format.html
    format.js
  end
end
