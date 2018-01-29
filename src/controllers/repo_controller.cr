class RepoController < ApplicationController
  def index
    letter = params["letter"]? || "a"
    repos = Repo.all("WHERE name LIKE '?%'", [letter])
    render("index.slang")
  end

  def show
    where_params = params.select(%w{provider owner name}).values

    repo = RepoVesion.first(<<~sql
      JOIN repos ON repo_versions.repo_id = repos.id
      WHERE repos.provider = ?
      AND repos.owner = ?
      AND repos.name = ?
    sql, where_params)

    if repo_version && repo_version.indexed
      render("show.slang")
    elsif repo_version.unresolved
      flash["warning"] = "Repo not found #{where_params.join('/')}"
      redirect_to "/all"
    else
      if !repo_version RepoWorker.perform(repo)
      render("processing.slang")
    end
  end
end
