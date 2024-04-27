let ranks = Belt.Array.range(1, 8)
let files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
type kbPhase =
  | Nothing
  | File(char)
  | Rank(char, int)

let fromChar = c => Js.String.fromCharCode(c->Char.code)

@react.component
let make = () => {
  let (phase, setPhase) = React.useState(() => Nothing)

  <div className="p-6">
    <h1 className="text-3xl font-semibold"> {"Chess Visualization"->React.string} </h1>
    <h2 className="text-2xl">
      {React.string(
        switch phase {
        | Nothing => "\u00A0"
        | File(file) => fromChar(file)
        | Rank(file, rank) => `${fromChar(file)}${rank->Int.toString}`
        },
      )}
    </h2>
    <div className="grid grid-cols-3 max-w-md">
      {switch phase {
      | Nothing =>
        files->Array.map(n => {
          let ns = Js.String.fromCharCode(n->Char.code)
          <TileButton
            key={ns}
            onClick={_event => {
              setPhase(_ => File(n))
            }}>
            {React.string(ns)}
          </TileButton>
        })
      | File(file) =>
        ranks->Array.map(rank => {
          let rankS = Belt.Int.toString(rank)
          <TileButton key={rankS} onClick={_event => setPhase(_ => Rank(file, rank))}>
            {React.string(rankS)}
          </TileButton>
        })
      | Rank(_) =>
        ranks->Array.map(rank =>
          <TileButton key={Belt.Int.toString(rank)}> {React.string("n/a")} </TileButton>
        )
      }->React.array}
      <TileButton
        key="⌫"
        onClick={_event => {
          setPhase(phase => {
            switch phase {
            | Nothing => Nothing
            | File(_) => Nothing
            | Rank(file, _rank) => File(file)
            }
          })
        }}>
        {React.string("⌫")}
      </TileButton>
    </div>
    // <div className="w-1/2 min-w-96 aspect-square">
    //   <Chessboard
    //     customPieces={{
    //       // wK: _ => <p> {React.string("hello")} </p>,
    //     }}
    //   />
    // </div>
  </div>
}
