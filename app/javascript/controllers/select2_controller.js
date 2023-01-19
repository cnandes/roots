
import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import 'select2/dist/css/select2.min.css'

// require("select2/dist/css/select2")
// require("select2-bootstrap-theme/dist/select2-bootstrap")

import Select2 from "select2"


export default class extends Controller {
  connect() {
    Select2()
    console.log("Hello from slect2 controller")
    $('.select2').select2();
  }
}
