import { Controller } from "@hotwired/stimulus";
import { Experience } from "./Experience/Experience.js";
import * as THREE from "three";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
import { OrbitControls } from "three/addons/controls/OrbitControls.js";

/* -------------------------------------------------------------------------- */
/*                    connect to data-controller="threejs"                    */
/* -------------------------------------------------------------------------- */

export default class extends Controller {
  connect() {
    console.log("hello stimulus", this.element);
    this.experience = new Experience(this.element);
  }
}
