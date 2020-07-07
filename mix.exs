defmodule WidgetlordsNifs.MixProject do
  use Mix.Project

  @version "0.3.6"
  @source_url "https://github.com/elcritch/widgetlords_nifs"

  def project do
    [
      app: :widgetlords_nifs,
      version: "0.1.0",
      elixir: "~> 1.9",
      source_url: @source_url,
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make | Mix.compilers()],
      make_targets: ["all"],
      make_clean: ["clean"],
      docs: docs(),
      aliases: [nim: [&nim_c/1, "nim"]],
      deps: deps()
    ]
  end

  defp description do
    "Use libwidgetlords in Elixir"
  end

  defp package do
    %{
      files: [
        "lib",
        "src",
        "mix.exs",
        "README.md",
        "PORTING.md",
        "LICENSE",
        "CHANGELOG.md",
        "Makefile"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    }
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp nim_c([]) do
    case System.find_executable("nim") do
      nil ->
        Mix.Shell.IO.info("Install Nim to generate C code.")

      _nimc ->
        System.cmd("make", ["nim"], cd: "src/", into: IO.stream(:stdio, :line))
    end
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.6", runtime: false},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
