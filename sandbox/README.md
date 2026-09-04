# Sandbox

Throwaway prototypes for js13kGames 2026. One folder per idea. Nothing here is
a submission — this is where we find out which ideas are fun.

## Rules of the sandbox

- One folder per prototype, `sandbox/<idea-name>/`.
- Every prototype has an `index.html` that runs by double-clicking it — no
  build step, no bundler, no npm. Inline the JS and CSS.
- Vanilla JS, no dependencies. If a prototype needs a library, that's a signal
  it's ready to graduate out of the sandbox.
- Don't optimize for size yet. Get the loop fun first; 13 kB is a packing
  problem we solve later. `size.sh` is there to tell us how much room is left,
  not to nag.
- Prefix any `localStorage` key with the prototype name — same habit the real
  competition requires.

## Start a new prototype

```sh
cp -r sandbox/_template sandbox/my-idea
open sandbox/my-idea/index.html
```

## Check the size

```sh
./sandbox/size.sh my-idea
```

Zips the folder and reports bytes used against the 13,312-byte limit.

## Serve locally

Needed if a prototype ever uses modules, fetch, or workers:

```sh
python3 -m http.server 8013 --directory sandbox
# http://localhost:8013/my-idea/
```

## Theme reminder

**Unicorns and Rainbows.** Deadline 13 September 2026, 13:00 CEST.
