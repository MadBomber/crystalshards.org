require "./spec_helper"

def repo_version_hash
  {"repo_id" => "Fake", "reftype" => "Fake", "ref" => "Fake", "spec" => "Fake", "documentation" => "Fake"}
end

def repo_version_params
  params = [] of String
  params << "repo_id=#{repo_version_hash["repo_id"]}"
  params << "reftype=#{repo_version_hash["reftype"]}"
  params << "ref=#{repo_version_hash["ref"]}"
  params << "spec=#{repo_version_hash["spec"]}"
  params << "documentation=#{repo_version_hash["documentation"]}"
  params.join("&")
end

def create_repo_version
  model = RepoVersion.new(repo_version_hash)
  model.save
  model
end

class RepoVersionControllerTest < GarnetSpec::Controller::Test
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

describe RepoVersionControllerTest do
  subject = RepoVersionControllerTest.new

  it "renders repo_version index template" do
    RepoVersion.clear
    response = subject.get "/repo_versions"

    response.status_code.should eq(200)
    response.body.should contain("Repo Versions")
  end

  it "renders repo_version show template" do
    RepoVersion.clear
    model = create_repo_version
    location = "/repo_versions/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Repo Version")
  end

  it "renders repo_version new template" do
    RepoVersion.clear
    location = "/repo_versions/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Repo Version")
  end

  it "renders repo_version edit template" do
    RepoVersion.clear
    model = create_repo_version
    location = "/repo_versions/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Repo Version")
  end

  it "creates a repo_version" do
    RepoVersion.clear
    response = subject.post "/repo_versions", body: repo_version_params

    response.headers["Location"].should eq "/repo_versions"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a repo_version" do
    RepoVersion.clear
    model = create_repo_version
    response = subject.patch "/repo_versions/#{model.id}", body: repo_version_params

    response.headers["Location"].should eq "/repo_versions"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a repo_version" do
    RepoVersion.clear
    model = create_repo_version
    response = subject.delete "/repo_versions/#{model.id}"

    response.headers["Location"].should eq "/repo_versions"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
