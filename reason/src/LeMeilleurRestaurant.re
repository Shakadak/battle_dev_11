let contestResponse = input => {
    input
    |> Js.Array.sliceFrom(1)
    |> Js.Array.map(x =>
        x
        |> Js.String.split(" ")
        |> Js.Array.map(Js.Float.fromString)
        |> Js.Array.reduce((+.), 0.)
    )
    |> Js.Array.reduce(Js.Math.max_float, 0.)
    |> x => x /. 3.
    |> ceil
    |> Js.log
}
