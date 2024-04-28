let ranks = Belt.Array.range(1, 8)
let files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
let fromChar = c => Js.String.fromCharCode(c->Char.code)
type squareColor =
  | Dark
  | Light

let randomSquare = () => {
  let rankIndex = Math.Int.random(0, ranks->Array.length)
  let fileIndex = Math.Int.random(0, files->Array.length)
  (files->Array.getUnsafe(fileIndex), ranks->Array.getUnsafe(rankIndex))
}

let string_of_square = ((file, rank)) => {
  `${fromChar(file)}${Int.toString(rank)}`
}

let color_of_square = ((file, rank)) => {
  let fileIndex = Array.indexOfOpt(files, file)->Option.getExn
  let rankIndex = Array.indexOfOpt(ranks, rank)->Option.getExn
  fileIndex->Int.mod(2) == rankIndex->Int.mod(2) ? Dark : Light
}

@new @module("chess.js")
external chess: unit => 'a = "Chess"
