# typed: false
# frozen_string_literal: true

# Homebrew formula for Probitas CLI
# Install: brew install jsr-probitas/tap/probitas
class Probitas < Formula
  desc "Scenario-based test and workflow execution framework CLI"
  homepage "https://github.com/jsr-probitas/cli"
  license "MIT"
  version "0.0.0"

  depends_on "deno"

  def install
    ENV["PROBITAS_VERSION"] = version.to_s
    ENV["PROBITAS_INSTALL_DIR"] = prefix
    system "curl", "-fsSL",
           "https://raw.githubusercontent.com/jsr-probitas/cli/main/install.sh",
           "-o", "install.sh"
    system "sh", "install.sh"
  end

  test do
    assert_match "probitas", shell_output("#{bin}/probitas --help")
  end
end
