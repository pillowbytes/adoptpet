import { Application } from "@hotwired/stimulus"

const application = Application.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
// application.register("carousel", Carousel)

export { application }
