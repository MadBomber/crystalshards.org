require "sidekiq"

class RepoWorker
  include Sidekiq::Worker

  def perform(repo : Repo)
    # Go grab information from the provider
    case repo.provider
    when "github"
      update_from_github(repo)
    when "bitbucket"
      update_from_bitbucket(repo)
    when "gitlab"
      update_from_gitlab(repo)
    end
  end

  private def update_from_github(repo)
    client = HTTP::Client.new("api.github.com", 443, true)
    client.basic_auth ENV["GITHUB_USER"], ENV["GITHUB_KEY"]
  end
end
