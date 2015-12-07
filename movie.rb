class Movie
  attr_accessor :url, :name, :year, :country, :release_date, :genre, :duration, :rating, :director, :stars

  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    @stars = @stars.split(',')
    @genre = @genre.split(',')

    @sort_date = case release_date.count('-')
      when 2
        Date.strptime(release_date, '%Y-%m-%d')
      when 1
        Date.strptime(release_date, '%Y-%m')
      when 0
        Date.strptime(release_date, '%Y')
    end
      .strftime('%m %B %Y')
  end


  def has_genre?(g)
    genre.include? g
  end


  def rating_to_stars
    '*' * rating[-1].to_i
  end


  def country?(c)
    country == c
  end


  def has_genre?(genre)
    self.genre.include? genre
  end


  def get_rating
    '*' * rating[-1].to_i
  end


  def get_stars
    stars.split(',').join(', ')
  end


  def get_genre
    genre.split(',').join(', ')
  end


  def format_release_date
    delimiters = release_date.count('-')

    date = case delimiters
      when 2
        Date.strptime(release_date, '%Y-%m-%d')
      when 1
        Date.strptime(release_date, '%Y-%m')
      when 0
        Date.strptime(release_date, '%Y')
    end
    
    date.strftime('%m %B %Y')
  end


  def country?(country)
    self.country == country
  end
end