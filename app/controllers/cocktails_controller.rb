class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:search].blank?
      @cocktails = Cocktail.all
    else
      @cocktails = Cocktail.where("name LIKE '%#{params[:search]}%'")
    end
  end

  def show
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
