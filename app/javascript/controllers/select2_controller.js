import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';

import "select2";


export default class extends Controller {
  connect() {
    $('.select2').select2({
      dropdownParent: $('.modal #select2parent'),
      allowClear: true,
      placeholder: "Select ...",
      width: '100%',
    });
  }
}
