require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'rake/clean'

require 'bundler'

Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :default => :test


# preparing submission

CLEAN.include('submission')
CLEAN.include('pkg')
CLOBBER.include('submission')
CLOBBER.include('pkg')


directory 'pkg'
directory 'submission'

task :package => [:pkg,:submission] do
  sh "mkdir pkg/src"
  # to make binaries work
  sh "git archive master | tar -x -C pkg"
  # to make src folder as required by spec
  sh "git archive master | tar -x -C pkg/src"
  sh "cp -R pkg/src/README.md pkg/README"
  sh "cd pkg;tar -cf ../submission/icfp-94704244.tgz *"
end


