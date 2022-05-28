// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "trix"
import "@rails/actiontext"
global.$ = require("jquery");
require("jquery-ui");


import '../js/bootstrap_js_files.js'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("packs/girls")
require("packs/posts")
require("packs/comments")
require("packs/poly_likes")
require("packs/inscriptions")
require("flatpickr")
require("flatpickr/dist/l10n/es.js").default.es;