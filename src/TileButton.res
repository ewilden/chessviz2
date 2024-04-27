//⌫

let tileButton = (props: JsxDOM.domProps) => {
  <div
    {...{
      ...props,
      className: ?None,
      onClick: ?None,
      children: ?None,
      disabled: ?None,
    }}
    className={"text-center border-solid border-2 border-sky-50 hover:bg-sky-100 align-middle flex place-content-center flex-col " ++
    props.className->Option.getOr("")}>
    <button
      className={"h-full w-full disabled:opacity-50 disabled:bg-slate-200"}
      onClick=?{props.onClick}
      disabled=?{props.disabled}>
      {props.children->Option.getOr(<> </>)}
    </button>
  </div>
}

let make = tileButton
