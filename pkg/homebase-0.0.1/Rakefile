
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name     'homebase'
  authors  'Jeremy Witmer'
  email    'jtwitmer@gmail.com'
  url      'https://github.com/uncertainprogress/Homebase'
}

