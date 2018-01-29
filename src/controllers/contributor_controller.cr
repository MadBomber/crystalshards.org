class ContributorController < ApplicationController
  def show
    if contributor = Contributor.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Contributor with ID #{params["id"]} Not Found"
      redirect_to "/contributors"
    end
  end
end
