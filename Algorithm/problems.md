* how to identify N lines before a pattern:
    the hardness lies in that we don't know when we will meet the pattern, so we have to keep N+1 lines all the times; or we can identify the position of the pattern in the first run, then extract lines in a second run, but this requires two running.
    Is there a way to do so without keeping N+1 lines (in case N is very large) in only one run? As convenient as extract N lines after a pattern

    This is actually similar to the story between Socratos and Plato, where Socratos asked student, Plato to pick up the most magnificent stalk in a vast wheat field with only once chance, and without going back. But Plato got nothing in the end, because he can't know if there is more magnificent stalk ahead when going through the field. This is the same problem we have here, we have no idea when we will meet the pattern, but we have only one chance and no storage for extra lines.
