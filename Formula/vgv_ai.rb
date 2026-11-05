# typed: false
# frozen_string_literal: true

# Configures the Very Good AI tooling for the coding agents on your machine.
class VgvAi < Formula
  desc "Configure Very Good AI coding agents and tooling"
  homepage "https://github.com/VeryGoodOpenSource/vgv_ai_cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.1.0/vgv_ai-0.1.0-macos-arm64.tar.gz"
      sha256 "117f1013b6bb510bd3490b50a0924d81982db775c8f5decd058e8f4e6dbc639e"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.1.0/vgv_ai-0.1.0-macos-x64.tar.gz"
      sha256 "01f6186f82b12530a02b695880465794a21cee4c9684236f0b51d9c0ca65860e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.1.0/vgv_ai-0.1.0-linux-arm64.tar.gz"
      sha256 "d0ffae8978a2047f3a7e98dc20fc300f10a98a1527ca327068f687f59fe5926a"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.1.0/vgv_ai-0.1.0-linux-x64.tar.gz"
      sha256 "b3d4a12ca474b3be6401a02e4e880cc3dd17fbb82d22050e6821c5da22cfda2c"
    end
  end

  def install
    bin.install "vgv_ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vgv_ai --version")
  end
end
