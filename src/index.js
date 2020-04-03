import "./main.css";
import { Elm } from "../src/Main.elm";
//import registerServiceWorker from "./registerServiceWorker";

const count =
  window.localStorage.getItem("count") === null
    ? 42
    : JSON.parse(window.localStorage.getItem("count"));

const elm = Elm.Main.init({
  node: document.getElementById("root"),
  flags: { count: count }
});

elm.ports.save.subscribe(json => {
  window.localStorage.setItem("count", json.count);
});

//registerServiceWorker();
