
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Homebase do
  before :each do
    Homebase.set_home_path() #called in the loading anyway
  end
  
  after :each do
    if(File.directory?(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')))
      FileUtils.rm_rf(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app'), )
    end
  end
  
  context 'a new application' do    
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
  
  context 'application path checking' do
    
    it 'should return true if the appname has been set' do
      Homebase.set_app('test_app')
      Homebase.check_app_name().should == true
    end
    
    it 'should raise AppNameNotSet if the appname has not been set' do
      lambda { Homebase.check_app_name()}.should raise_error(AppNameNotSet, "The app name must be set in Homebase before any other operation")
    end
    
    it 'raises AppNameNotSet if the app name is not set before another call' do
      lambda { Homebase.get_file_path('test_file')}.should raise_error(AppNameNotSet, "The app name must be set in Homebase before any other operation")
      lambda { Homebase.get_app_path()}.should raise_error(AppNameNotSet, "The app name must be set in Homebase before any other operation")
      lambda { Homebase.create_file('test_file')}.should raise_error(AppNameNotSet, "The app name must be set in Homebase before any other operation")
      lambda { Homebase.delete_file('test_file')}.should raise_error(AppNameNotSet, "The app name must be set in Homebase before any other operation")
    end
    
  end
  
  
  context 'an existing application' do
    before :each do
      Homebase.set_app('test_app')
      File.new(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app' + ::File::SEPARATOR + 'test_file'), 'w')
    end
    
    it 'correctly accesses a file in the home directory' do
      Homebase.get_file_path('test_file').should == Homebase.get_app_path() + ::File::SEPARATOR + 'test_file'
    end
    
    it 'returns nil if the file does not exist' do
      Homebase.get_file_path('random_file').should == false
    end
  end
  
  context 'creating a new file' do
    before :each do
      Homebase.set_app('test_app')
    end
    
    it 'should return the file path to the new file' do
      Homebase.create_file('new_file').should == File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app' + ::File::SEPARATOR + 'new_file')
      Homebase.get_file_path('new_file').should == File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app' + ::File::SEPARATOR + 'new_file')
    end
    
    it 'should raise FileAlreadyExists if the file already exists' do
      File.new(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app' + ::File::SEPARATOR + 'new_file'), 'w')
      lambda { Homebase.create_file('new_file')}.should raise_error(FileAlreadyExists, "That file already exists in the application Homebase directory")
    end
  end
  
  context 'deleting a file' do
    before :each do
      Homebase.set_app('test_app')
    end
    
    it 'should return silently if the file does not exist' do
      Homebase.delete_file('test_file').should == true
    end
    
    it 'should successfully delete the file' do
      Homebase.create_file('test_file')
      File.exists?(Homebase.get_file_path('test_file')).should == true
      Homebase.delete_file('test_file').should == true
      Homebase.get_file_path('test_file').should == false
    end
  end
  
  context 'removing the application' do
    before :each do
      Homebase.set_app('test_app')
    end
    
    it 'should be successful with an empty app directory' do
      File.exists?(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')).should == true
      Homebase.delete_app('test_app').should == true
      File.exists?(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')).should == false
    end
    
    it 'should be successful with a non-empty app directory' do
      Homebase.create_file('new_file')
      Homebase.delete_app('test_app').should == true
      File.exists?(File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')).should == false
    end
    
    it 'should return silently if the directory does not exist' do
      Homebase.delete_app('some_random_test_application').should == true
    end
    
    it 'should return false if the given file is not a directory' do
      Homebase.create_file('new_file')
      Homebase.delete_app(File.join('.test_app' + ::File::SEPARATOR + 'new_file')).should == false
    end
  end
  
end

