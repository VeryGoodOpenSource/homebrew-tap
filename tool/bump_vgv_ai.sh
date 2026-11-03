#!/bin/bash
# Moves Formula/vgv_ai.rb to a vgv_ai_cli release.
#
#   tool/bump_vgv_ai.sh <tag> <checksums-dir>
#
# <checksums-dir> holds the vgv_ai-<os>-<arch>.tar.gz.sha256 files attached to
# the release. Only the release tag in each url and the sha256 after it are
# rewritten, so the rest of the formula stays as it was written by hand.
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "usage: $0 <tag> <checksums-dir>" >&2
  exit 64
fi

tag="v${1#v}"
checksums_dir="$2"
formula="Formula/vgv_ai.rb"

fail() {
  echo "error: $*" >&2
  exit 1
}

[ -f "$formula" ] || fail "$formula does not exist"

checksums=()
for target in macos-arm64 macos-x64 linux-arm64 linux-x64; do
  file="${checksums_dir}/vgv_ai-${target}.tar.gz.sha256"
  [ -f "$file" ] || fail "missing $file"
  checksums+=("${target}=$(cut -d ' ' -f 1 <"$file")")
done

updated="$(mktemp)"
trap 'rm -f "$updated"' EXIT

# Each url names its archive, so the sha256 that follows it is that archive's.
awk -v tag="$tag" -v checksums="${checksums[*]}" '
  BEGIN {
    count = split(checksums, pairs, " ")
    for (i = 1; i <= count; i++) {
      split(pairs[i], pair, "=")
      sha256[pair[1]] = pair[2]
    }
  }
  /^ *url "/ && match($0, /vgv_ai-[a-z]+-[a-z0-9]+\.tar\.gz/) {
    target = substr($0, RSTART + 7, RLENGTH - 14)
    sub(/\/download\/v[^\/]+\//, "/download/" tag "/")
    bumped[target]++
  }
  /^ *sha256 "/ && target != "" {
    sub(/"[0-9a-f]+"/, "\"" sha256[target] "\"")
    target = ""
  }
  { print }
  END {
    for (target in sha256) {
      if (bumped[target] != 1) {
        printf "error: expected one url for vgv_ai-%s.tar.gz, found %d\n",
          target, bumped[target] > "/dev/stderr"
        exit 1
      }
    }
  }
' "$formula" >"$updated" || exit 1

mv "$updated" "$formula"
