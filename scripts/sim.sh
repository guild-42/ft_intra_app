#!/usr/bin/env bash
# AI-driveable iOS-simulator harness for ft_intra.
#
# Closes the dev/test loop without a physical device or APNs/Firebase: inject
# push + GPS locally, then screenshot to verify. The simulator runs the real
# native app (WebView, geofence, secure storage, FCM-handling code all live),
# so this exercises far more than the Chrome web build can.
#
# Requires only Xcode command-line tools (xcrun simctl). A simulator must be
# booted (`flutter run` against it, or `xcrun simctl boot <udid>`).
#
# Usage:
#   ./scripts/sim.sh shot [name]              screenshot booted sim → /tmp/<name>.png
#   ./scripts/sim.sh push <type>              local push (type: evalpo_sale|new_event|review|friend_online)
#   ./scripts/sim.sh geo in|out|<lat> <lng>   set simulated location (in/out = at/away from Tokyo campus)
#   ./scripts/sim.sh tap <x> <y>              tap (needs idb; prints install hint if missing)
#
# Tapping note: simctl has no tap primitive. For UI taps either use idb
# (`brew install idb-companion && pipx install fb-idb`) or, preferably, write
# Flutter integration_test flows (test/ integration) which drive the widget
# tree directly and run headlessly with pass/fail output.
set -euo pipefail

BUNDLE="com.guild42.ftIntra42"
# 42 Tokyo campus geofence center (app/lib/config/constants.dart).
TOKYO_LAT=35.6604
TOKYO_LNG=139.7292
# ~2km away — outside the 250m geofence, to trigger an exit/checkout.
AWAY_LAT=35.6812
AWAY_LNG=139.7671

cmd="${1:-}"; shift || true

case "$cmd" in
  shot)
    name="${1:-sim}"
    out="/tmp/${name}.png"
    xcrun simctl io booted screenshot "$out" >/dev/null 2>&1
    echo "$out"
    ;;

  push)
    type="${1:?type required: evalpo_sale|new_event|review|friend_online}"
    case "$type" in
      evalpo_sale)   title="Evaluation points sale"; body="[SIM] 50% off, today only!"; extra='"type":"evalpo_sale","source_date":"2026-06-13"' ;;
      new_event)     title="New event: Test workshop"; body="[SIM] Join us in cluster 1"; extra='"type":"new_event","source_date":"2026-06-13"' ;;
      review)        title="Evaluation scheduled"; body="[SIM] libft - you correct peer"; extra='"type":"review","scale_team_id":"424242"' ;;
      friend_online) title="Friend online"; body="[SIM] peer logged in at c1r2s3"; extra='"type":"friend_online","user_id":"424242"' ;;
      *) echo "unknown type: $type" >&2; exit 1 ;;
    esac
    tmp="$(mktemp /tmp/push.XXXX.json)"
    # Custom keys sit beside "aps" → firebase_messaging surfaces them as
    # message.data, so notification-tap deep-link routing is exercised too.
    printf '{"Simulator Target Bundle":"%s","aps":{"alert":{"title":"%s","body":"%s"},"sound":"default"},%s}\n' \
      "$BUNDLE" "$title" "$body" "$extra" > "$tmp"
    xcrun simctl push booted "$BUNDLE" "$tmp"
    rm -f "$tmp"
    ;;

  geo)
    sub="${1:?in|out|<lat> <lng>}"
    case "$sub" in
      in)  xcrun simctl location booted set "$TOKYO_LAT,$TOKYO_LNG"; echo "at campus ($TOKYO_LAT,$TOKYO_LNG)" ;;
      out) xcrun simctl location booted set "$AWAY_LAT,$AWAY_LNG";   echo "away ($AWAY_LAT,$AWAY_LNG)" ;;
      *)   lat="$sub"; lng="${2:?lng required}"; xcrun simctl location booted set "$lat,$lng"; echo "at $lat,$lng" ;;
    esac
    ;;

  tap)
    x="${1:?x}"; y="${2:?y}"
    if command -v idb >/dev/null 2>&1; then
      idb ui tap "$x" "$y"
    else
      echo "idb not installed. Install: brew install idb-companion && pipx install fb-idb" >&2
      echo "Or prefer Flutter integration_test for deterministic UI flows." >&2
      exit 1
    fi
    ;;

  *)
    grep '^#' "$0" | sed 's/^# \{0,1\}//'
    ;;
esac
