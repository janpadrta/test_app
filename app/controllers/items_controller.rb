class ItemsController < ApplicationController
  def create
    item = Item.new(item_params)

    respond_to do |format|
      if item.save
        format.html { redirect_to item.deed, notice: 'Item was successfully created.' }
      else
        format.html { redirect_to Deed.find(item_params[:deed_id]), alert: item.errors.full_messages.join(' ') }
      end
    end
  end

  def destroy
    item = Item.find(params[:id])
    deed = item.deed
    item.destroy
    respond_to do |format|
      format.html { redirect_to deed, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :deed_id, :variant_id)
  end
end
