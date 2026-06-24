# ElyraOS Tombstone Metadata

ElyraOS records ROM identity in native crash tombstones through debuggerd.

## Properties

```properties
ro.elyra.version
ro.lineage.version
ro.build.fingerprint
ro.revision
```

## Compatibility

`lineage_version` is intentionally preserved in the tombstone protobuf. Some LineageOS-derived tools may still expect this field.

ElyraOS adds a separate `elyra_version` field instead of replacing the existing one.

## Reason

Native crashes are often reported as tombstones. Adding ElyraOS metadata helps maintainers confirm exactly which ROM version produced the crash.
