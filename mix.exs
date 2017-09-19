defmodule Gocardless.Mixfile do
  use Mix.Project

  def project do
    [app: :gocardless,
     version: "1.0.2",
     description: "Elixir wrapper for the GoCardless API",
     package: package(),
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpotion],
     mod: {Gocardless, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.14", only: :dev},
     {:httpotion, "~> 3.0.3"},
     {:poison, "~> 3.0"},
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false}]
  end

  defp package do
    [
      maintainers: ["overture8", "tosbourn"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/PiggyPot/gocardless"}
    ]
  end
end
