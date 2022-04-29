# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Harvester < Formula
  desc "Harvester CLI is a project that aims to provide an opinionated CLI tool to easily manage VMs on Harvester, the promising HCI solution created by Rancher Labs/SUSE"
  homepage "https://github.com/belgaied2/harvester-cli/"
  url "https://github.com/belgaied2/harvester-cli/releases/download/v0.1.0/harvester-v0.1.0-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "1785f3af8e7eea24ad539a9e03d8a3da71905b8e6da23816a671eaf070525496"
  license "GPL-3"

  # depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # system "go", "build", *std_go_args(ldflags: "-s -w")
    bin.install "harvester"
  end

  # test do
  #   # `test do` will create, run in and delete a temporary directory.
  #   #
  #   # This test will fail and we won't accept that! For Homebrew/homebrew-core
  #   # this will need to be a test that verifies the functionality of the
  #   # software. Run the test with `brew test harvester`. Options passed
  #   # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
  #   #
  #   # The installed folder is not in the path, so use the entire path to any
  #   # executables being tested: `system "#{bin}/program", "do", "something"`.
  #   system "false"
  # end
end
