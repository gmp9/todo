class TasksController < ApplicationController
    
  def index
    @tasks = Task.all
  end
   
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def create
    @task = Task.new(secure_params)
  
    if @task.save
      redirect_to task_path(@task)
    else
       render 'new'
    end
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(secure_params)
      redirect_to @task
    else
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    #redirect to the index 
    redirect_to tasks_path
  end
  
  
  private
  
  def secure_params
    params.require(:task).permit(:date, :item, :status)
  end
  
end
