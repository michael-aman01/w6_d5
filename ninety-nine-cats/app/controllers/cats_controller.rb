class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        if @cat
            render :show
        else
            @cat.errors.full_messages, status_code = 422
        end
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat && @cat.save!
            redirect_to cat_url(@cat)
        else
            render @cat.errors.full_messages, status_code: 422
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def new
        @cat = Cat.new
        render :new
    end

    def update
    end
    
    private 
    def cat_params
        params.require(:cat).permit(:sex, :color, :name, :birth_date)
    end
    

end
