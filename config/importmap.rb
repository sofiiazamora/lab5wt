pin "@rails/ujs", to: "ujs.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "application", preload: true
pin "controllers", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
