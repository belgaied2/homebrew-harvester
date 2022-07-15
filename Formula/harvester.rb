class Harvester < Formula
  desc "CLI tool to manage VMs on Harvester"
  homepage "https://github.com/belgaied2/harvester-cli"
  url "https://github.com/belgaied2/harvester-cli.git",
      tag:      "v0.1.2",
      revision: "926218df1595d7efdc9c879d723e278f72e58fe9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/belgaied2/homebrew-harvester/releases/download/harvester-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_monterey:  "21e516b1d03645b9b8de90cb8c26c08c841fb721d0d5d5d2e0cf6af700eb25ee"
    sha256 cellar: :any_skip_relocation, monterey:        "184f0eac2476bb19f5b68a595a0dee091e42f648b598ce36693e2afa39c61431"
    sha256 cellar: :any_skip_relocation, big_sur:         "eb01fa997acd095fb1e90b841fcc1c84267b1b9c45c250738758a7af19bbd264"
    sha256 cellar: :any_skip_relocation, catalina:        "cde8e976b7f5b9cd7e73b7f4232507ec32edbfeb5d32d5bf034240dd2f07622d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:    "117b94b91266fa3bdbe6ed36349f3549f46e490d18cc3dc5fbaf66e911b86836"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.VERSION=#{version}")
  end

  test do
    output_table = shell_output("#{bin}/harvester login https://localhost -t token 2>&1", 1).split("\n")
    output = output_table.pop[/msg="(.*)"/, 1]
    assert_match "invalid token", output
  end
end
