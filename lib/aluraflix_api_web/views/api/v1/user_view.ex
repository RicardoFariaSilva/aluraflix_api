defmodule AluraflixApiWeb.Api.V1.UserView do
  use AluraflixApiWeb, :view

  def render("user.json", %{user: user, token: token}) do
    %{email: user.email,
      token: token}
  end
end
