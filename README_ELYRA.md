# ElyraOS System Core

This repository keeps the Android `system/core` tree close to the LineageOS/AOSP base while adding a minimal ElyraOS identity layer.

## Scope

ElyraOS changes in this tree should stay small because `system/core` contains sensitive runtime components such as init, debuggerd, fastboot, fs_mgr, libcutils, libutils, and adb-related infrastructure.

## Current ElyraOS Additions

- ElyraOS version metadata in debuggerd tombstones.
- LineageOS tombstone compatibility is preserved.
- Documentation for future system/core changes.
- Lightweight validation helper for branding references.

## Recommended Policy

Avoid large framework-style features in this repository. Place ROM configuration, overlays, and product branding in `vendor/elyra` whenever possible.
