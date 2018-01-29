require "./spec_helper"

def contributor_hash
  {"username" => "Fake", "provider" => "Fake"}
end

def contributor_params
  params = [] of String
  params << "username=#{contributor_hash["username"]}"
  params << "provider=#{contributor_hash["provider"]}"
  params.join("&")
end

def create_contributor
  model = Contributor.new(contributor_hash)
  model.save
  model
end

class ContributorControllerTest < GarnetSpec::Controller::Test
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

describe ContributorControllerTest do
  subject = ContributorControllerTest.new

  it "renders contributor index template" do
    Contributor.clear
    response = subject.get "/contributors"

    response.status_code.should eq(200)
    response.body.should contain("Contributors")
  end

  it "renders contributor show template" do
    Contributor.clear
    model = create_contributor
    location = "/contributors/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Contributor")
  end

  it "renders contributor new template" do
    Contributor.clear
    location = "/contributors/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Contributor")
  end

  it "renders contributor edit template" do
    Contributor.clear
    model = create_contributor
    location = "/contributors/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Contributor")
  end

  it "creates a contributor" do
    Contributor.clear
    response = subject.post "/contributors", body: contributor_params

    response.headers["Location"].should eq "/contributors"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a contributor" do
    Contributor.clear
    model = create_contributor
    response = subject.patch "/contributors/#{model.id}", body: contributor_params

    response.headers["Location"].should eq "/contributors"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a contributor" do
    Contributor.clear
    model = create_contributor
    response = subject.delete "/contributors/#{model.id}"

    response.headers["Location"].should eq "/contributors"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
