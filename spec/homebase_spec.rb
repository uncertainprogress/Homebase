
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Homebase do
  
  before :each do
    Homebase.set_home_path()
  end
  
  it 'correctly establishes the home directory' do   
    Homebase.get_home_path().should == File.expand_path('~')
  end
  
  it 'correctly sets the application name' do
    Homebase.set_app('test_app')
    Homebase.get_app_path().should == File.join(File.expand_path('~') + ::File::SEPARATOR + '.test_app')
  end
  
  it 'fails if the directory does not exist and create is set to "false"' do
    lambda { Homebase.set_app('test_app', false) }.should raise_error(DirectoryDoesNotExist, "The specified configuration directory doesn't exist in the user's home directory.")
    
  end
  
  it 'creates the application directory if it does not exist' do
    true.should == false
  end
  
end

