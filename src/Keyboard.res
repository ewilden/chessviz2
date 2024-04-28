let ranks = Chess.ranks
let files = Chess.files
type kbPhase =
  | Nothing
  | File(char)
  | Rank(char, int)

let fromChar = Chess.fromChar
let nbsp = "\u00A0"

@react.component
let make = (~onSubmit: string => unit) => {
  let (phase, setPhase) = React.useState(() => Nothing)
  <>
    <p className="text-2xl">
      {React.string(
        switch phase {
        | Nothing => nbsp
        | File(file) => fromChar(file)
        | Rank(file, rank) => `${fromChar(file)}${rank->Int.toString}`
        },
      )}
    </p>
    <div
      className="grid grid-cols-3 max-w-md border-solid border-2 border-b-0 border-sky-50 text-xl">
      {switch phase {
      | Nothing =>
        files->Array.map(n => {
          let ns = fromChar(n)
          <TileButton className="aspect-video" key={ns} onClick={_ => setPhase(_ => File(n))}>
            {React.string(ns)}
          </TileButton>
        })
      | File(file) =>
        ranks->Array.map(rank => {
          let rankS = Belt.Int.toString(rank)
          <TileButton
            className="aspect-video" key={rankS} onClick={_ => setPhase(_ => Rank(file, rank))}>
            {React.string(rankS)}
          </TileButton>
        })
      | Rank(_) =>
        ranks->Array.map(rank =>
          <TileButton disabled={true} className="aspect-video" key={Belt.Int.toString(rank)}>
            {React.string(nbsp)}
          </TileButton>
        )
      }->React.array}
      <TileButton
        className="aspect-video"
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
    <div className="max-w-md border-solid border-2 border-sky-50 border-t-0">
      {
        let onClick = switch phase {
        | Nothing | File(_) => None
        | Rank(file, rank) => Some(_ => onSubmit(`${fromChar(file)}${rank->Int.toString}`))
        }

        <TileButton disabled={Option.isNone(onClick)} className="h-20" onClick=?{onClick}>
          {React.string("Enter")}
        </TileButton>
      }
    </div>
  </>
}
