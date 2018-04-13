class Group {
    constructor() {
        this.content = [];
    }

    add(value) {
        if (!this.has(value)) {
            this.content.push(value);
        }
    }

    delete(value) {
        let index = this.content.indexOf(value);
        if (index !== -1) {
            this.content.splice(index, 1);
        }
    }

    has(value) {
        return this.content.indexOf(value) !== -1;
    }

    static from(collection) {
        let result = new Group();
        for (const item of collection) {
            result.add(item);
        }
        return result;
    }
}

let group = Group.from([10, 20]);
console.log(group.has(10));
// → true
console.log(group.has(30));
// → false
group.add(10);
group.delete(10);
console.log(group.has(10));
// → false

