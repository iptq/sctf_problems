Control Panel
======

This is a simple example of NoSQL injection. The objective is to inject the
parameters `admin = true` into the registration form. Then, the flag will be
displayed to the user on the account page. If the user did not inject the value,
there will be a hint indicating that `admin` is not set to `true`.

Users should be able to guess that the database is document-based because the
user document is displayed to the user on the account page if he doesn't
successfully set `admin` to `true`. If people on IRC asking for help don't
realize this, or are asking for SQL hints, tell them simply to look at the
account page for more clues.

The site is reset every 5 minutes, and the database is reset every 15 minutes,
so if anything goes wrong, just wait it out.