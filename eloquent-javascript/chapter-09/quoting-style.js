let input = "'I'm the cook,' he said, 'it's my job.'"
let result = input.replace(/(^|\W)'|'(\W|$)/g, '$1"');

console.log(input);
console.log(result);