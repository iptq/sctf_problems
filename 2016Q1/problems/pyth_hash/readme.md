# Pythagoras' hash

A really bad hash function brewed in an hour.

## Oracle

The oracle lives at http://problems1.2016q1.sctf.io:17117/. It accepts a base64-encoded input passed via the query string, for up to 32 bytes of input (post-base64-decode).

Players can interface with the oracle using your browser (e.g. http://problems1.2016q1.sctf.io:17117/?dGhlIGZsYWc=), cURL, or anything, really.

    $ hash() { curl 'http://problems1.2016q1.sctf.io:17117/?'"$(echo -n $1 | base64)"; }
    $ hash 'the flag'
    d0d27218a363a192

## Hints given in the problem text

* "Pythagoras' hash"
* "Sliding window"
* The inclusion of the `b2f64` function not used anywhere except `work`
