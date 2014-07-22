HTMLWidgets.widget({
  name: "sparkline",
  renderValue: function(el, data) {
    $(el).sparkline(data.values, data.options);
  }
});
