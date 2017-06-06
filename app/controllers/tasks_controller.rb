class TasksController < ApplicationController

	before_action :set_task, only: [ :show, :destroy, :edit, :update ]

	def index
		@tasks = Task.all
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to @task, success: 'Task successfully created'
		else
			render :new, danger: 'Whoops, something wrong' 
		end
	end

	def edit
	end

	def update
		if @task.update_attributes(task_params)
			redirect_to @task, success: 'Task successfully updated'
		else
			render :edit, danger: 'Whoops, something wrong' 
		end
	end

	def destroy
		@task.destroy
		redirect_to tasks_path, success: 'Task successfully deleted'
	end


	private

	def task_params
		params.require(:task).permit(:name, :summary, :description)
	end

	def set_task
		@task = Task.find(params[:id])
	end

end