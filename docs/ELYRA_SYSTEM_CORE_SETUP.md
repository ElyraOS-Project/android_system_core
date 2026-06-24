# ElyraOS System Core Setup

`system/core` is one of the most sensitive Android platform repositories. ElyraOS should keep this tree as close as possible to the upstream LineageOS/AOSP base.

## What belongs here

- Low-level runtime changes that cannot live in `vendor/elyra`.
- Crash/debug metadata that helps identify ElyraOS builds.
- Small compatibility patches needed by device bring-up.

## What should not be added here early

- Heavy branding replacements.
- UI features.
- Device-specific hacks.
- Product overlays.
- Performance tweaks that can be handled from device/vendor trees.

## Initial ElyraOS behavior

The first ElyraOS patch adds `ro.elyra.version` into debuggerd tombstone protobuf output while keeping the existing `ro.lineage.version` field intact.

This makes crash reports easier to identify without breaking LineageOS-compatible tooling.

## Expected tombstone output

```text
ElyraOS Version: '1.0-Aurora'
LineageOS Version: '23.2-...'
Build fingerprint: '...'
```

If `ro.elyra.version` is not set, the value will show as `unknown`.
