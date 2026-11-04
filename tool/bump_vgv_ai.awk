# Rewrites a formula for the release named by -v tag, given -v checksums as
# space-separated <os>-<arch>=<sha256> pairs. Each url names its archive, so
# the sha256 that follows it is that archive's. Used by tool/bump_vgv_ai.sh.

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
      printf "error: expected one url for vgv_ai-%s.tar.gz, found %d\n", target, bumped[target] > "/dev/stderr"
      exit 1
    }
  }
}
