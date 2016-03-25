# Corruption

The original PNG is a photo of ice kacang with the flag text inserted with Paint.NET, then corrupted with [PNGlitch](https://github.com/ucnv/pnglitch) by setting one byte in the compressed Zlib stream to zero.

Note that some viewers (Firefox was one) may refuse to display the corrupted Zlib byte stream, _since the Zlib CRCs were not changed_ (hint).
