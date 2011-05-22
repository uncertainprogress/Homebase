
module Homebase
  
  def self.set_home_path()
    @home_path = File.expand_path('~')
    @app_name= nil
  end
  
  def self.get_home_path()
     return @home_path
   end
  
  def self.set_app(name, create = true) 
    @app_name = name
    if(@app_name[0] != '.')
      @app_name = '.' + @app_name
    end
      
    @app_path = File.join(@home_path + ::File::SEPARATOR + @app_name)
    
    if(!File.directory?(@app_path))
      
      if(!create)
         raise DirectoryDoesNotExist.new("The specified configuration directory doesn't exist in the user's home directory.")
      end
      
      Dir.mkdir(@app_path)
    end
    
  end
  
  def self.get_app_path()
    self.check_app_name()
    return @app_path
  end
  
  def self.get_file_path(name)
    self.check_app_name()
    if(File.exists?(@app_path + ::File::SEPARATOR + name))
      return @app_path + ::File::SEPARATOR + name
    end
    
    return false
  end
  
  def self.create_file(name)
    self.check_app_name()
    
    if(self.get_file_path(name))
      raise FileAlreadyExists.new("That file already exists in the application Homebase directory")
    end
    File.new(File.join(@app_path + ::File::SEPARATOR + name), 'w')
    return self.get_file_path(name)
  end
  
  def self.delete_file(name)
    self.check_app_name()
    if(self.get_file_path(name))
      FileUtils.rm_rf(self.get_file_path(name))
    end
    return true
  end
  
  def self.delete_app(name)
    if(name[0] != '.')
      name = '.' + name
    end
    path = File.join(@home_path + ::File::SEPARATOR + name)
    if(File.exists?(path))
      return false unless(File.directory?(path))
      FileUtils.rm_rf(path)
    end
    return true
  end
  
  def self.check_app_name()
    return true if @app_name
    raise AppNameNotSet.new("The app name must be set in Homebase before any other operation")
  end
  
end