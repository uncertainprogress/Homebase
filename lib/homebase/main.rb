
module Homebase
  
  def self.set_home_path()
    @home_path = File.expand_path('~')
  end
  
  def self.get_home_path()
     return @home_path
   end
  
  def self.set_app(name, create = true) 
    @app_name = name
    @app_path = File.join(@home_path + ::File::SEPARATOR + '.test_app')
    
    if(!File.directory?(@app_path))
      
      if(!create)
         raise DirectoryDoesNotExist.new("The specified configuration directory doesn't exist in the user's home directory.")
      end
      
      
    end
    
  end
  
  def self.get_app_path()
    return @app_path
  end
  
  def self.get_file(name)
    
  end
  
end