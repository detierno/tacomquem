class RemindersController < ApplicationController
  before_filter :find_lend
  
  def new
    @reminder = @lend.reminders.new
  end

  def create
    @reminder = @lend.reminders.create(params[:reminder])

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to lends_path, notice: 'Reminder was successfully created.' }
        format.json { render json: @reminder, status: :created, location: @reminder }
      else
        format.html { render action: "new" }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def find_lend
    @lend = current_user.lends.find(params[:lend_id])
  end
end