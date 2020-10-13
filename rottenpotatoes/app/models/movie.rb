class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.same_director movie_title
    @movie = Movie.find_by_title(movie_title)
    director_name = @movie.director
    if director_name.nil? || director_name == ""
      return nil
    else
      Movie.where(director: director_name).pluck(:title)
    end 
  end
end
