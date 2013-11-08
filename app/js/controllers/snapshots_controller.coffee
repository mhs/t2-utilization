App.SnapshotsController = Ember.ArrayController.extend
  sortProperties: ['snapDate']
  sortAscending: false
  dateBinding: "App.snapshotsUI.date"

  dateRange: (->
    date = moment(@get("date"))
    daysInWindow = @get("daysInWindow")
    date = moment()  unless date.isValid()
    dateArray = []
    monday = moment(date).startOf("week").add("days", 1)
    i = 0

    while i <= (daysInWindow / 7)
      dateArray.push moment(monday).add("week", i).format("MMM D")
      i++
    dateArray
  ).property("date", "daysInWindow")

  firstDate: (->
    moment(App.snapshotsUI.get("date")).format "MMMM D, YYYY"
  ).property("date")

