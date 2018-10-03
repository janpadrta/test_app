class VariantsController < ApplicationController
  def create
    variant = Variant.new(variant_params)

    respond_to do |format|
      if variant.save
        format.html { redirect_to variant.product, notice: 'Variant was successfully created.' }
      else
        format.html { redirect_to Product.find(variant_params[:product_id]), notice: variant.errors.full_messages.join(' ') }
      end
    end
  end

  def destroy
    variant = Variant.find(params[:id])
    product = variant.product
    variant.destroy

    respond_to do |format|
      format.html { redirect_to product, notice: 'Variant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def variant_params
    params.require(:variant).permit(:name, :product_id)
  end
end
