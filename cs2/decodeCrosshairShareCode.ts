import {
  decodeCrosshairShareCode,
  crosshairToConVars,
  Crosshair,
} from "csgo-sharecode";

const shareCode = "CSGO-xCR9J-bh3rj-JHxJe-BM3oQ-7T8SA";
const crosshair: Crosshair = decodeCrosshairShareCode(shareCode);
const conVars = crosshairToConVars(crosshair);
console.log(conVars);
