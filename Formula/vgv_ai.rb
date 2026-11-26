# typed: false
# frozen_string_literal: true

# Configures the Very Good AI tooling for the coding agents on your machine.
class VgvAi < Formula
  desc "Configure Very Good AI coding agents and tooling"
  homepage "https://github.com/VeryGoodOpenSource/vgv_ai_cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.4.0/vgv_ai-0.4.0-macos-arm64.tar.gz"
      sha256 "6827b6dc986ef1b97b3b6def041f1d3380ef14f28aa27736f93e0cb332d3006b"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.4.0/vgv_ai-0.4.0-macos-x64.tar.gz"
      sha256 "f0fe48ada5b3197545b51418262dc91ef8dfd989620f57f721315062435d7da3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.4.0/vgv_ai-0.4.0-linux-arm64.tar.gz"
      sha256 "1bc76c8c25f2c1cfd7752d09090f0e51fdf1a4a04fe6794f9120eb0207a506ad"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.4.0/vgv_ai-0.4.0-linux-x64.tar.gz"
      sha256 "02a543258b9c469de6ca7afe9ef8c29c402968c837b28a4248aab77b17c4d9b2"
    end
  end

  def install
    bin.install "vgv_ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vgv_ai --version")
  end
end
