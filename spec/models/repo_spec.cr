require "./spec_helper"
require "../../src/models/repo.cr"

describe Repo do
  Spec.before_each do
    Repo.clear
  end
end
