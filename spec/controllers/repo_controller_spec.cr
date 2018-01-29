require "./spec_helper"

def repo_hash
  {"name" => "Fake", "source" => "Fake", "user" => "Fake", "stars" => "1", "weekly_clones" => "1"}
end

def repo_params
  params = [] of String
  params << "name=#{repo_hash["name"]}"
  params << "source=#{repo_hash["source"]}"
  params << "user=#{repo_hash["user"]}"
  params << "stars=#{repo_hash["stars"]}"
  params << "weekly_clones=#{repo_hash["weekly_clones"]}"
  params.join("&")
end

def create_repo
  model = Repo.new(repo_hash)
  model.save
  model
end

class RepoControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe RepoControllerTest do
  subject = RepoControllerTest.new

  it "renders repo index template" do
    Repo.clear
    response = subject.get "/repos"

    response.status_code.should eq(200)
    response.body.should contain("Repos")
  end

  it "renders repo show template" do
    Repo.clear
    model = create_repo
    location = "/repos/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Repo")
  end

  it "renders repo new template" do
    Repo.clear
    location = "/repos/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Repo")
  end

  it "renders repo edit template" do
    Repo.clear
    model = create_repo
    location = "/repos/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Repo")
  end

  it "creates a repo" do
    Repo.clear
    response = subject.post "/repos", body: repo_params

    response.headers["Location"].should eq "/repos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a repo" do
    Repo.clear
    model = create_repo
    response = subject.patch "/repos/#{model.id}", body: repo_params

    response.headers["Location"].should eq "/repos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a repo" do
    Repo.clear
    model = create_repo
    response = subject.delete "/repos/#{model.id}"

    response.headers["Location"].should eq "/repos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
