# typed: false
# frozen_string_literal: true

# Homebrew formula for Probitas CLI
# Install: brew install probitas-test/tap/probitas
class Probitas < Formula
  desc "Scenario-based test and workflow execution framework CLI"
  homepage "https://github.com/probitas-test/probitas"
  license "MIT"
  version "0.14.1"

  # Use repository tarball as source (required by Homebrew)
  # Actual installation is done via install.sh from JSR
  url "https://github.com/probitas-test/probitas/archive/refs/heads/main.tar.gz"

  depends_on "deno"

  def install
    ENV["PROBITAS_VERSION"] = version.to_s
    ENV["PROBITAS_INSTALL_DIR"] = prefix
    system "sh", "install.sh"
  end

  test do
    assert_match "probitas", shell_output("#{bin}/probitas --help")
  end
end
