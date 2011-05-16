
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Homebase do
  
  context 'a new application' do
    before :each do
      Homebase.set_home_path()
    end
    
    after :each do
      if(File.directory?(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')))
        Dir.rmdir(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app'))
      end
    end
  
    it 'correctly establishes the home directory' do   
      Homebase.get_home_path().should == File.expand_path('~')
    end
  
    it 'correctly sets the application name and adds the "." to create the hidden directory path' do
      Homebase.set_app('test_app')
      Homebase.get_app_path().should == File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')
    end
  
    it 'does not add the "." for the hidden directory if it is already on the app name' do
      Homebase.set_app('.test_app')
      Homebase.get_app_path().should == File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')
    end
  
    it 'fails if the directory does not exist and create is set to "false"' do
      lambda { Homebase.set_app('test_app', false) }.should raise_error(DirectoryDoesNotExist, "The specified configuration directory doesn't exist in the user's home directory.")
    
    end
  
    it 'creates the application directory if it does not exist' do
      Homebase.set_app('.test_app')
      File.directory?(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')).should == true
    end
  end
  
  
  context 'an existing application' do
    before :each do
      Homebase.set_app('test_app')
      File.touch(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app' + ::File::SEPARATOR + 'test_file'))
    end
    
    after :each do
      if(File.directory?(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')))
        Dir.rmdir(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app'))
      end
    end
    
    it 'correctly accesses a file in the home directory' do
      
    end
  end
  
end

