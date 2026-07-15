# SHCCF Experiment Lifecycle – Design Notes

## Current decisions

- Starting a new experiment stores start time and current total-energy reading.
- The finish timestamp and final energy reading are stored only when the
  experiment is explicitly completed.
- `Adopt Existing Experiment` should ask only for a historical start timestamp
  and current phase.
- SHCCF should retrieve the historical energy reading automatically from Home
  Assistant recorder/history data at or immediately before that timestamp.
- Manual entry of historical measurements is not the intended final workflow.
- Reliable arbitrary history lookup is outside plain YAML templates and
  automations; implement it through a small SHCCF history service or the future
  native integration.
- Recorder retention and missing historical data require explicit handling.
- Pause/resume remains planned, including elapsed time, active time, paused time,
  accumulated energy and timeline events.
