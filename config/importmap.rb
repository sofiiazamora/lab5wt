pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "controllers", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"