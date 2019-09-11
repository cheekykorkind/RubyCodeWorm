require 'json'
require_relative 'requester_worm'

class AbsoluteZeroTreeWorm < RequesterWorm
  def initialize(clone_url)
    @clone_url = clone_url

  end

  def start()
    puts @clone_url

    puts system("cd githubRepositories && git clone #{@clone_url}")
    # puts system("/usr/bin/git status")
    # puts system("git status")
  end


end
