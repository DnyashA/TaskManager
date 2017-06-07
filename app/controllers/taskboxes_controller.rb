class TaskboxesController < ApplicationController

	before_action :authenticate_user!
	
	before_action :set_taskbox, only: [ :show, :destroy, :edit, :update ]

	def index
		@taskboxes = Taskbox.all
	end

	def show
		@tasks = Task.where(taskbox_id: [@taskbox.subtree_ids])
	end

	def new
		@taskbox = Taskbox.new
		@taskboxes = Taskbox.all.order(:name)
	end

	def create
		@taskbox = Taskbox.new(taskbox_params)
		if @taskbox.save
			redirect_to @taskbox, success: 'Taskbox successfully created'
		else
			@taskboxes = Taskbox.all.order(:name)
			flash.now[:danger] = 'Whoops, something wrong' 
			render :new
		end
	end

	def edit
		@taskboxes = Taskbox.where("id != #{@taskbox.id}").order(:name)
	end

	def update
		if @taskbox.update_attributes(taskbox_params)
			redirect_to @taskbox, success: 'Taskbox successfully updated'
		else
			@taskboxes = Taskbox.where("id != #{@taskbox.id}").order(:name)
			flash.now[:danger] = 'Whoops, something wrong' 
			render :edit
		end
	end

	def destroy
		@taskbox.destroy
		redirect_to taskboxes_path, success: 'Taskbox successfully deleted'
	end


	private

	def taskbox_params
		params.require(:taskbox).permit(:name, :parent_id)
	end

	def set_taskbox
		@taskbox = Taskbox.find(params[:id])
	end
end