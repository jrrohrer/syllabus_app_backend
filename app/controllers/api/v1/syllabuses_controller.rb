class Api::V1::SyllabusesController < ApplicationController

  def index
    syllabuses = Syllabus.all
    # render json: syllabuses # (returns an array of objects)
    # options ={
      # include associated category
      # include: [:category] # has to match the associations in the model
    #}
    render json: SyllabusSerializer.new(syllabuses) # (returns a data object containing an array of objects. Objects have an attributes object with attributes nested inside. It gives us more specificity when working with our data on large scale.)
  end

  def create
    syllabus = Syllabus.new(syllabus_params)
    if syllabus.save
      # if the object is good, render the data and send an 'accepted' status m
      render json: SyllabusSerializer.new(syllabus), status: :accepted
    else
      # if object doesn't save, render an error 
      render json: {errors: syllabus.errors.full_messages}, status: :unprocessable_entity # server understood the request, but there was a problem with information sent in the request
    end
  end

  private

  def syllabus_params
    params.require(:syllabus).permit(:title, :description, :image_url, :category_id)
  end

end
