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

    // method named with Symbol.iterator symbol
    // must return object with a next method which returns
    // an obj as a result with value, done property
    [Symbol.iterator]() {
        let nextIndex = 0;
        return {
            // cannot refer to this of wrapping scope in regular function!

            // next: function() {
            //     if (nextIndex < this.content.length) {
            //         return { value: content[nextIndex++], done: false };
            //     }
            //     return { done: true };
            // }

            next: () => nextIndex < this.content.length ?  
                { value: this.content[nextIndex++], done: false } : { done: true }
        }
    }
}

let group = Group.from([1, 2, 3, 4, 5]);
for (const item of group) {
    console.log(item);
}