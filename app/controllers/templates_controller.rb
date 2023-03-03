class TemplatesController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    def index
        @templates = Template.all
    end

    def new
        @template = Template.new
    end

    def create
        @template = helpers.current_user.templates.new(template_params)

        if @template.save
            flash[:notice] = "Template uploaded successfully."
            redirect_to templates_path
        else
            flash[:notice] = "Hmm...sorry is wrong. Please try again."
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @template = Template.find(params[:id])
    end

    def update
        @template = Template.find(params[:id])

        if @template.update(template_params)
            redirect_to templates_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @template = Template.find(params[:id])
    end

    def destroy
        @template = Template.find(params[:id])

        @template.destroy
        redirect_to templates_path
    end

    private
    def template_params
        params.require(:template).permit(:title, :image_path, tag_ids: [])
    end
end
