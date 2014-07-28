HTMLWidgets.widget({
  name: "sparkline",
  type: "output",
  renderValue: function(el, data) {
    $(el).sparkline(data.values, data.options);
  }
});
