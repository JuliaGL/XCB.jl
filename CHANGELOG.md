# Changelog for XCB.jl

## Version `v0.7`

- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] The utility functions `is_key_event`, `is_button_event`, `is_pointer_event` and `is_window_event` have been removed, in favor of new bitmask combinations `KEY_EVENT`, `BUTTON_EVENT`, `POINTER_EVENT` and `WINDOW_EVENT`.

## Version `v0.6`

- ![BREAKING][badge-breaking] Adaptation to upstream changes to WindowAbstractions.jl. Check out the related [CHANGELOG](https://github.com/serenity4/WindowAbstractions.jl/blob/master/CHANGELOG.md), some of these changes having a significant impact on XCB.jl.

## Version `v0.5`

- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] `Base.run(::XWindowManager; kwargs...)` now only accepts a single keyword argument `sleep_time`, removing the ability to customize `execute_callback` and removing `poll` such that by default a mix of polling and (optionally) sleeping is done according to `sleep_time` (instead of either polling or calling a blocking C function). `iter_first` and `iter_last` keyword arguments are no longer available, and you should make your own event loop with `poll_event` and `process_event` if you want further customization.
- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] Closing a window is now done by returning a `CloseWindow` instance instead of throwing it as an exception. Note that it is still an `Exception`, so you can easily reproduce the old behavior with a manual `try`/`catch` block.
- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] The time field of `EventDetails` is now filled with the time since epoch, and not since the window has been created. You can always get the time since window creation yourself by recording `t0 = time()` when creating the window and subtracting it if desired.

[badge-breaking]: https://img.shields.io/badge/BREAKING-red.svg
[badge-deprecation]: https://img.shields.io/badge/deprecation-orange.svg
[badge-feature]: https://img.shields.io/badge/feature-green.svg
[badge-enhancement]: https://img.shields.io/badge/enhancement-blue.svg
[badge-bugfix]: https://img.shields.io/badge/bugfix-purple.svg
[badge-security]: https://img.shields.io/badge/security-black.svg
[badge-experimental]: https://img.shields.io/badge/experimental-lightgrey.svg
[badge-maintenance]: https://img.shields.io/badge/maintenance-gray.svg

<!--
# Badges (reused from the CHANGELOG.md of Documenter.jl)

![BREAKING][badge-breaking]
![Deprecation][badge-deprecation]
![Feature][badge-feature]
![Enhancement][badge-enhancement]
![Bugfix][badge-bugfix]
![Security][badge-security]
![Experimental][badge-experimental]
![Maintenance][badge-maintenance]
-->
