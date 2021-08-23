class StudentsController < ApplicationController
  before_action :authenticate_student!, :only => [:show]
  def index
    @students=Student.all
  end

  def show
    @student=student.find(params[:id])
    @currentUserEntry=Entry.where(student_id: current_student.id)
    @studentEntry=Entry.where(student_id: @student.id)
    if @student.id == current_student.id
    else
      @currentStudentEntry.each do |cs|
        @studentEntry.each do |s|
          if cs.room_id == s.room_id then
            @isRoom = true
            @roomId = cs.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
