Venkman::Application.routes.draw do
  api_version(
    module: "V1",
    header: {
      name: "Accept",
      value: "application/vnd.venkman-app.com; version=1"
    }
  ) do
    # Add Resources Here
  end

  # API Generated Documentation
  apipie
end
