//⌫

let tileButton = (props: JsxDOM.domProps) => {
  <div
    {...{
      ...props,
      className: ?None,
      onClick: ?None,
      children: ?None,
    }}
    className={"text-center border-solid border-2 border-sky-50 hover:bg-sky-100 aspect-video align-middle flex place-content-center flex-col" ++
    props.className->Option.getOr("")}>
    <button className="h-full w-full" onClick=?{props.onClick}>
      {props.children->Option.getOr(<> </>)}
    </button>
  </div>
}

let make = tileButton
