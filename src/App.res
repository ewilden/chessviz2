@react.component
let make = () => {
  <div className="p-6">
    <h1 className="text-3xl font-semibold"> {"Chess Visualization"->React.string} </h1>
    <Keyboard onSubmit={sq => Js.Console.log(sq)} />
    // <div className="w-1/2 min-w-96 aspect-square">
    //   <Chessboard />
    // </div>
  </div>
}
