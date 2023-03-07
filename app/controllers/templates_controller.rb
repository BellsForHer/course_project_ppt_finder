class TemplatesController < ApplicationController
    before_action :set_template, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show]
    before_action :require_same_user, only: [:destroy]


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
            debugger
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
            redirect_to template_path
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
    def require_same_user
        if helpers.current_user != @template.current_user
            flash[:notice] = "Unauthorized!"
            redirect_to helpers.current_user
        end
    end

    def set_template
        @template = Template.find(params[:id])
    end
    
    def template_params
        params.require(:template).permit(:title, :image_path, :file, tag_ids: [])
    end
end
