// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Core__Option from "@rescript/core/src/Core__Option.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";

function tileButton(props) {
  var newrecord = Caml_obj.obj_dup(props);
  var newrecord$1 = Caml_obj.obj_dup((newrecord.onClick = undefined, newrecord.className = undefined, newrecord.children = undefined, newrecord));
  return JsxRuntime.jsx("div", (newrecord$1.className = "text-center border-solid border-2 border-sky-50 hover:bg-sky-100 aspect-video align-middle flex place-content-center flex-col" + Core__Option.getOr(props.className, ""), newrecord$1.children = JsxRuntime.jsx("button", {
                    children: Core__Option.getOr(props.children, JsxRuntime.jsx(JsxRuntime.Fragment, {})),
                    className: "h-full w-full",
                    onClick: props.onClick
                  }), newrecord$1));
}

var make = tileButton;

export {
  make ,
}
/* react/jsx-runtime Not a pure module */