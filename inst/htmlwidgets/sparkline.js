HTMLWidgets.widget({
  name: "sparkline",
  type: "output",
  renderValue: function(el, data) {
    // if renderTag provided then we will do two things
    //   1.  set height and width to 0 and display none
    //   2.  set our el to the render tag if available
    if(data.renderSelector && $(data.renderSelector).length){
      el.css({
        'height': '0',
        'width': '0',
        'display': 'none'
      });
      el = data.renderSelector;
    }
    $(el).sparkline(data.values, data.options);
  }
});
