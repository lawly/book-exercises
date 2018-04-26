// 1. car and cat
var regex1 = /ca[tr]/;
verify(regex1,
    ["my car", "bad cats"],
    ["camper", "high art"]);

// 2. pop and prop
var regex2 = /pr?op/;
verify(regex2,
    ["pop culture", "mad props"],
    ["plop", "prrrop"]);

// 3. ferret, ferry, and ferrari
var regex3 = /^ferr(et|y|ari)$/;
verify(regex3,
    ["ferret", "ferry", "ferrari"],
    ["ferrum", "transfer A"]);

// 4. Any word ending in ious
var regex4 = /ious\b/;
verify(regex4,
    ["how delicious", "spacious room"],
    ["ruinous", "consciousness"]);

// 5. A whitespace character followed by a period, comma, colon, or semicolon
var regex5 = /\s[.,:;]/;
verify(regex5,
    ["bad punctuation ."],
    ["escape the period"]);

// 6. A word longer than six letters
var regex6 = /\w{7,}/;
verify(regex6,
    ["hottentottententen"],
    ["no", "hotten totten tenten"]);

// 7. A word without the letter e (or E)
var regex7 = /\b[^\We]+\b/i;
verify(regex7,
    ["red platypus", "wobbling nest"],
    ["earth bed", "learning ape", "BEET"]);

function verify(regexp, yes, no) {
    // Ignore unfinished exercises
    if (regexp.source == "...") return;
    for (let str of yes) if (!regexp.test(str)) {
      console.log(`Failure to match '${str}'`);
    }
    for (let str of no) if (regexp.test(str)) {
      console.log(`Unexpected match for '${str}'`);
    }
  }