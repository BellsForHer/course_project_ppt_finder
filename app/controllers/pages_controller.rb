class PagesController < ApplicationController
  def home
    @templates = Template.all
    @tag = Tag.all
  end

  def about_us
  end
end
