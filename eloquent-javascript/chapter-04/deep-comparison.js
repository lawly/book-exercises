function deepEqual(x, y) {
    if (typeof x !== 'object' && typeof x === typeof y) return x === y; // 2 bool, string, number, ..
    if (x == null && y == null) return true;
    if (typeof x == 'object' && x !== null) {
        let propertiesX = Object.keys(x), propertiesY = Object.keys(y);
        if (propertiesX.length !== propertiesY.length) return false;
        for (let property of propertiesX) {
            if (!propertiesY.includes(property)) return false;
            return deepEqual(x[property], y[property]);
        }
    }
    return false;
}