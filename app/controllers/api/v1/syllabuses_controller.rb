class Api::V1::SyllabusesController < ApplicationController

  def index
    syllabuses = Syllabus.all
    render json: syllabuses
  end

  def create
    syllabus = Syllabus.new(syllabus_params)
    if syllabus.save
      # if the object is good, render the data and send an 'accepted' status m
      render json: syllabus, status: :accepted 
    else
      # if object doesn't save, render an error 
      render json: {errors: syllabus.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def syllabus_params
    params.require(:syllabus).permit(:title, :description, :image_url, :category_id)
  end

end
