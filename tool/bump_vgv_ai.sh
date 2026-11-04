#!/bin/bash
# Moves Formula/vgv_ai.rb to the latest vgv_ai_cli release and prints its tag.
#
#   tool/bump_vgv_ai.sh
#
# Needs an authenticated gh, such as one with GH_TOKEN set. Only the release
# tag in each url and the sha256 after it are rewritten, so the rest of the
# formula stays as it was written by hand.
set -euo pipefail

repository="VeryGoodOpenSource/vgv_ai_cli"
formula="Formula/vgv_ai.rb"
rewrite="$(dirname "$0")/bump_vgv_ai.awk"

fail() {
  echo "error: $*" >&2
  exit 1
}

[[ -f "${formula}" ]] || fail "${formula} does not exist"

# vgv_ai_plugins releases alongside the CLI under its own tags, so only vX.Y.Z
# tags are the CLI's.
tag="$(gh release list --repo "${repository}" \
  --exclude-drafts --exclude-pre-releases --limit 20 --json tagName \
  --jq '[.[].tagName | select(test("^v[0-9]+\\.[0-9]+\\.[0-9]+$"))][0] // empty')"
[[ -n "${tag}" ]] || fail "no vgv_ai_cli release found"

checksums_dir="$(mktemp -d)"
updated="$(mktemp)"
trap 'rm -rf "${checksums_dir}" "${updated}"' EXIT

gh release download "${tag}" --repo "${repository}" \
  --pattern 'vgv_ai-*.tar.gz.sha256' --dir "${checksums_dir}" >&2

checksums=()
for target in macos-arm64 macos-x64 linux-arm64 linux-x64
do
  file="${checksums_dir}/vgv_ai-${target}.tar.gz.sha256"
  [[ -f "${file}" ]] || fail "${tag} has no vgv_ai-${target}.tar.gz.sha256"
  checksums+=("${target}=$(cut -d ' ' -f 1 <"${file}")")
done

awk -v tag="${tag}" -v checksums="${checksums[*]}" -f "${rewrite}" \
  "${formula}" >"${updated}" || exit 1

mv "${updated}" "${formula}"
echo "${tag}"
