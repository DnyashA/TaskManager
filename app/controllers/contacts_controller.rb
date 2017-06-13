class ContactsController < ApplicationController
	
	before_action :authenticate_user!
	
	before_action :set_contact, only: [ :show, :destroy, :edit, :update ]

	after_action :set_uid, only: :create

	def index
		@contacts = Contact.all
	end

	def show
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to @contact, success: 'Contact successfully created'
		else
			flash.now[:danger] = 'Whoops, something wrong' 
			render :new
		end
	end

	def edit
	end

	def update
		if @contact.update_attributes(contact_params)
			redirect_to @contacts, success: 'Contact successfully updated'
		else
			flash.now[:danger] = 'Whoops, something wrong' 
			render :edit
		end
	end

	def destroy
		@contact.destroy
		redirect_to tasks_path, success: 'Contact successfully deleted'
	end


	private

	def contact_params
		params.require(:contact).permit(:email, :synonim, :owner_id, :user_id)
	end

	def set_contact
		@contact = Contact.find(params[:id])
	end

	def set_uid
		if User.find_by(email: "#{@contact.email}").present?
			@contact.user_id = User.find_by(email: "#{@contact.email}").id
			@contact.save
		else
			flash.now[:danger] = 'User with this email does not exist' 
			@contact.destroy
		end
	end
end