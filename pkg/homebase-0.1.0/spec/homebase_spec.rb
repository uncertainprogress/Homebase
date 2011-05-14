
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Homebase do
  it 'correctly establishes the home directory' do
    Homebase.set_home_path()    
    Homebase.get_path().should == "Hello World"
  end
  
end

