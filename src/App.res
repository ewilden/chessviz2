@react.component
let make = () => {
  let (square, setSquare) = React.useState(Chess.randomSquare)
  let (history, setHistory) = React.useState(() => [])
  let pushHistory = item => setHistory(h => [...h, item])

  <div className="p-6">
    <h1 className="text-3xl font-semibold"> {"What color is this square?"->React.string} </h1>
    <h2 className="text-2xl font-semibold mt-8 mb-4"> {React.string("Record so far:")} </h2>
    <p className="text-xl"> {Array.join(history, " ")->React.string} </p>
    <h2 className="text-xl mt-4 mb-8"> {React.string(Chess.string_of_square(square))} </h2>
    <SquareColorPicker
      onPick={squareColor => {
        pushHistory(squareColor == Chess.color_of_square(square) ? "✅" : "❌")
        setSquare(_ => Chess.randomSquare())
      }}
    />
    <p className="mt-4">
      {React.string("Hint: squares whose files and ranks have the same parity are dark.")}
    </p>
  </div>
}
