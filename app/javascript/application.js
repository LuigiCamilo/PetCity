// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// import { application } from "./controllers/application";
import show_controller from "./controllers/show_controller.js"; ;

Stimulus.register("add-quantity", show_controller)
