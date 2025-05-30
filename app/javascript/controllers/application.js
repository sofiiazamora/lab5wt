import Rails from "@rails/ujs"
Rails.start()

import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import "controllers"

const application = Application.start()
window.Stimulus = application
