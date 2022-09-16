class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        if @cat
            render json: @cat
        else
            @cat.errors.full_messages, status_code = 422
        end
    end

    def create

    end

    def edit
    end

    def new
    end

    def update
    end
    
    private 
    def cat_params
        params.require(:cat).permit(:sex, :color, :name, :birth_date)
    end
    

end
