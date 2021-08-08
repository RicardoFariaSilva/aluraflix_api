defmodule AluraflixApiWeb.Api.V1.UserControllerTest do
  use AluraflixApiWeb.ConnCase

  @create_attrs %{
    email: "email1@email.com",
    password: "password"
  }
  @invalid_attrs %{ email: nil, password: nil }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_v1_user_path(conn, :create), user: @create_attrs)
      assert @create_attrs.email == json_response(conn, 201)["email"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_v1_user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "signin user" do
    test "renders token when credentials are correct", %{conn: conn} do
      conn = post(conn, Routes.api_v1_user_path(conn, :create), user: @create_attrs)
      assert @create_attrs.email == json_response(conn, 201)["email"]
      conn = post(conn, Routes.api_v1_user_path(conn, :signin),
                  email: @create_attrs.email,
                  password: @create_attrs.password)
      assert %{
        "token" => _token,
        "email" => "email1@email.com"
      } = json_response(conn, 201)
    end

    test "renders error when credentials are invalid", %{conn: conn} do
      conn = post(conn, Routes.api_v1_user_path(conn, :create), user: @create_attrs)
      assert @create_attrs.email == json_response(conn, 201)["email"]
      conn = post(conn, Routes.api_v1_user_path(conn, :signin),
                  email: @create_attrs.email,
                  password: "wrong")
      assert %{"errors" => %{"detail" => "Unauthorized"}} == json_response(conn, 401)
    end
  end
end
