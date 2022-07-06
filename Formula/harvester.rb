class Harvester < Formula
  desc "CLI tool to manage VMs on Harvester"
  homepage "https://github.com/belgaied2/harvester-cli"
  url "https://github.com/belgaied2/harvester-cli.git",
      tag:      "v0.1.1",
      revision: "290c2f25241c235c47f3f23db1902aa095cf679b"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.VERSION=#{version}")
  end

  test do
    outputTable = shell_output("#{bin}/harvester login https://localhost -t token 2>&1", 1).split("\n")
    output = outputTable.pop[/msg="(.*)"/, 1]
    assert_match "invalid token", output
  end
end
