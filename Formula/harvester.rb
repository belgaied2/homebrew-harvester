class Harvester < Formula
  desc "CLI tool to manage VMs on Harvester"
  homepage "https://github.com/belgaied2/harvester-cli"
  url "https://github.com/belgaied2/harvester-cli.git",
      tag:      "v0.1.1",
      revision: "290c2f25241c235c47f3f23db1902aa095cf679b"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/belgaied2/homebrew-harvester/releases/download/harvester-0.1.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur: "1d5f3f6fca5f0786d2985c32178ce89d95751d464174ffa2ad6e832bb5a94f59"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d05668392f5644f2f6b99f3d52ab80b94a50b052f16bdbf396bae3f1d13f965b"
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
