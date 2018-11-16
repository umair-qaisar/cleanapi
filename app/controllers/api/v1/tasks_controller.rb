class Api::V1::TasksController < ApplicationController
    def index
      @tasks = Task.all
      render json: @tasks
    end

    def show
      @task = Task.find_by(id: params[:id])
      render json: @task
    end
  
  
    def create
      @task = Task.new(task_params)
      if @task.save
        render json: @task
      else
        render json: {error: 'Unable to create task.'}, status: 400
      end
    end

    def destroy
      @task = Task.find_by(id: params[:id])
        if@task
          @task.destroy()
        end
      render json: {message: 'done!'}
    end
  
    private
    def task_params
      params.require(:task).permit(:date, :title, :location, :time, :beforeImage, :afterImage, :user_id, :progress)
    end
  end