HTMLWidgets.widget({
  name: "sparkline",
  type: "output",
  renderValue: function(el, data) {
    // if renderTag provided then we will do three things
    //   1.  set height and width to 0 and display none
    //   2.  set our el to the render tag if available
    //   3.  set height and width options to null
    if(data.renderSelector && $(data.renderSelector).length){
      $(el).css({
        'height': '0',
        'width': '0',
        'display': 'none'
      });
      el = data.renderSelector;
      // set height and width to null
      //   this might be confusing and need to be reverted
      data.options.height = null;
      data.options.width = null;
    }
    $(el).sparkline(data.values, data.options);
    
    // experimental addComposite function in R
    //   will add composites to data.composites
    if(data.composites) {
      if(!Array.isArray(data.composites)) {
        data.composites = [data.composites];
      }
      data.composites.map( function(spk) {
        $(el).sparkline(spk.values,spk.options);
      });
    }
  }
});
