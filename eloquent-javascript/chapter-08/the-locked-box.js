const box = {
  locked: true,
  unlock() {
    this.locked = false;
  },
  lock() {
    this.locked = true;
  },
  _content: [1, 2, 3, 'Michael', 1337],
  get content() {
    if (this.locked) throw new Error("Locked!");
    return this._content;
  }
};

function withBoxUnlocked(boxFunction = () => undefined) {
    if (box.locked) box.unlock();
    try {
        return boxFunction();
    } finally {
        box.lock();
    }
}

let boxFunction = function() {
    return box.content;  
};

for (let item of withBoxUnlocked(boxFunction)) {
    console.log(item);
}