module ProductsHelper
  def highlight_variant(variant)
    'animated flash delay-1s slow' if variant.id == params[:variant_highlight].to_i
  end
end
