class Harvester < Formula
  desc "CLI tool to manage VMs on Harvester"
  homepage "https://github.com/belgaied2/harvester-cli"
  url "https://github.com/belgaied2/harvester-cli.git",
      tag:      "v0.1.2",
      revision: "926218df1595d7efdc9c879d723e278f72e58fe9"
  license "Apache-2.0"

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
