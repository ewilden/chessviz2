@react.component
let make = (~onPick: Chess.squareColor => unit) => {
  <div className="grid grid-cols-2 max-w-md border-solid border-2 border-b-0 border-sky-50 text-xl">
    {[Chess.Dark, Chess.Light]
    ->Array.map(color => {
      let colorString = switch color {
      | Chess.Dark => "Dark"
      | Chess.Light => "Light"
      }
      let className = switch color {
      | Chess.Dark => " bg-gray-900 text-white hover:bg-gray-700 "
      | Chess.Light => " text-black "
      }
      <TileButton
        className={"aspect-video " ++ className} key={colorString} onClick={_ => onPick(color)}>
        {React.string(colorString)}
      </TileButton>
    })
    ->React.array}
  </div>
}
