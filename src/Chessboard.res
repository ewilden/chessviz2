type customPieces = {wK?: unit => Jsx.element}

@react.component @module("react-chessboard")
external make: (~customPieces: customPieces=?) => Jsx.element = "Chessboard"
