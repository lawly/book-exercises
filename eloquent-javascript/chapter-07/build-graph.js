const roads = [
    "Alice's House-Bob's House", "Alice's House-Cabin",
    "Alice's House-Post Office", "Bob's House-Town Hall",
    "Daria's House-Ernie's House", "Daria's House-Town Hall",
    "Ernie's House-Grete's House", "Grete's House-Farm",
    "Grete's House-Shop", "Marketplace-Farm",
    "Marketplace-Post Office", "Marketplace-Shop",
    "Marketplace-Town Hall", "Shop-Town Hall"
];

function buildGraph(roads) {
    let graph = Object.create(null);

    function addEdge(from, to) {
        if (graph[from] === undefined) {
            graph[from] = [].concat(to);
        } else {
            graph[from].push(to);
        }
    }

    for (let [from, to] of roads.map(x => x.split('-'))) {
        console.log(from, " ", to);
        addEdge(from, to);
        addEdge(to, from);
    }

    return graph;
}

let graph = buildGraph(roads);
console.log(graph);