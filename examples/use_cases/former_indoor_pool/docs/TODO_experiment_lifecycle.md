# TODO additions – SHCCF Experiment Lifecycle

- [ ] Implement `Adopt Existing Experiment` with automatic recorder/history lookup.
- [ ] Retrieve the last valid energy state at or immediately before the selected start time.
- [ ] Preserve the selected experiment phase when adopting an existing experiment.
- [ ] Never set finish time or energy end during start/adopt.
- [ ] Set finish time and energy end only when explicitly completing the experiment.
- [ ] Handle missing or expired history data with a clear user-facing message.
- [ ] Keep Adopt Existing Experiment disabled/provisional until history lookup exists.
- [ ] Design and implement pause/resume.
- [ ] Distinguish elapsed duration, active duration and paused time.
- [ ] Aggregate energy and runtime across multiple active intervals.
- [ ] Record pause/resume events in the experiment timeline.
