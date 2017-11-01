require 'rails_helper'

describe MoviesController do
  
  describe 'load homepage', :type => :request do
    it 'should load up RottenPotatoes homepage' do
      get root_path
      expect(response).to redirect_to movies_path
    end
  end
  
  describe 'index' do
    it 'index should load RottenPotatoes homepage' do
      get :index
      expect(current_path).to eq('\movies')
    end
  end
  
  describe 'show movie', :type => :request do
    it 'should try to find movie in database' do
      expect{get movie_path("movie that is not in database")}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
  describe 'new movie' do
    it 'should not save movie object right away' do
      get :new
      expect(assigns(:movie).new_record?).to eq(true) # assigns relates to the instance variables created within a controller action
    end
  end
  
  describe 'create movie' do
    it 'should save movie object' do
      movie = Movie.new(
        :title => "new movie",
        :rating => "PG-13",
        :release_date => "1992-11-25 00:00:00",
        :description => "no desc"
      )
      post :create, :params => {:movie => movie.attributes}
      expect(assigns(:movie).persisted?).to eq(true)
    end
  end
  
  describe 'edit movie' do
    it 'should try to find movie in database' do
      expect{get :edit, :params => {:id => "movie that is not in database"}}.to raise_error(ActiveRecord::RecordNotFound)
    end
    it 'should not save change to movie object right away' do
      movie = Movie.create!(
        :title => "new movie",
        :rating => "PG-13",
        :release_date => "1992-11-25 00:00:00",
        :description => "no desc"
      )
      get :edit, :params => {:id => movie.id}
      expect(assigns(:movie).changed?).to eq(false)
    end
  end
  
  describe 'update movie' do
    it 'should update movie object after save changes' do
      movie = Movie.create!(
        :title => "new movie",
        :rating => "PG-13",
        :release_date => "1992-11-25 00:00:00",
        :description => "no desc"
      )
      edited_movie = Movie.new(
        :title => "edited movie",
        :rating => "PG-13",
        :release_date => "1992-11-25 00:00:00",
        :description => "this movie has been edited"
      )
      put :update, :params => {:id => movie.id, :movie => edited_movie.attributes}
      expect(assigns(:movie).title).to eq("edited movie")
    end
  end
  
  describe 'delete movie' do
    it 'should destroy specified movie object from activerecord' do
      movie = Movie.create!(
        :title => "new movie",
        :rating => "PG-13",
        :release_date => "1992-11-25 00:00:00",
        :description => "no desc"
      )
      get :destroy, :params => {:id => movie.id}
      expect(assigns(:movie).destroyed?).to eq(true)
    end
  end
  
end