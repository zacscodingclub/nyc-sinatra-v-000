class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

    if !params[:landmark][:figure_id].empty?
      figure = Figure.find_or_create_by(id: params[:landmark])
      @landmark.figure_id = figure.id
      @landmark.save
    end

    erb :'landmarks/show'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/show'
  end
end
