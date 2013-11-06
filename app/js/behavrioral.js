$.fn.buttonClick = function(activeState) {
  $(this).click(function() {
    $(this).addClass(activeState);
    $(this).siblings().removeClass(activeState);
  });
};

$(function (){

  $('.snapshot-forecast-button').buttonClick('snapshot-forecast-button-selected');
  $('nav button').buttonClick('selectedOffice');

});
