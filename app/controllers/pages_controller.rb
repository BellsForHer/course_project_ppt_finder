class PagesController < ApplicationController
  def home
    @templates = Template.all
    @tags = Tag.all

    
  end

  

  def show 
    @template = Template.find(params[:id])
    @tag = Tag.find(params[:id])

  end
  
  
end
