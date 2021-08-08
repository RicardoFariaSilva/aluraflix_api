defmodule AluraflixApiWeb.Auth.ErrorHandlerTest do
  use AluraflixApiWeb.ConnCase

  alias AluraflixApiWeb.Auth.ErrorHandler

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "auth_error" do
    test "renders errors", %{conn: conn} do
      error_message = "error"
      conn = ErrorHandler.auth_error(conn, {error_message, ""}, nil)
      assert json_response(conn, 401)["error"] == error_message
    end
  end
end
