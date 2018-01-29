class GithubService
  getter @client : HTTP::Client

  def initialize
    self.client = HTTP::Client.new("api.github.com", 443, true)
    client.basic_auth ENV["GITHUB_USER"], ENV["GITHUB_KEY"]
  end

  def get_repo_info(owner : String, name : String)
    client.get("/repos/#{owner}/#{name}")
  end

  def get_repo_shard(owner : String, name : String)
    client.get("/repos/#{owner}/#{name}/contents/shard.yml")
  end
end
