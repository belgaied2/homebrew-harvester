class Harvester < Formula
  desc "CLI tool to manage VMs on Harvester"
  homepage "https://github.com/belgaied2/harvester-cli"
  url "https://github.com/belgaied2/harvester-cli.git",
      tag:      "v0.1.0",
      revision: "c2962916b7e379b609c5092247ec28f0c8875a09"
  license "Apache-2.0"

  depends_on "go" => :build

  def install

    system "go", "build", *std_go_args(ldflags: "-s -w -X main.VERSION=#{version}")
  end

  test do
    output = shell_output("#{bin}/harvester login https://localhost -t token 2>&1", 1).split("\n").pop[/msg=\"(.*)\"/, 1]
    assert_match "invalid token", output
  end
end