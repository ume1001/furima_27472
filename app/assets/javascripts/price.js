$(function(){
 
  $('.price-content').on('keyup', function(){
    let input = $('.price-content').val();
    $.ajax( {
      type: 'GET',
      url: '/items/new',
      data: { keyword: input },
      dataType: 'json'
    })

    //$.ajax( {
      //type: 'GET',
      //url: '/items/:id/edit',
      //data: { keyword: input },
      //dataType: 'json'
    //})

    .done(function(item) {
      let price = Number($('#item_price').val());
      var item = price * 0.10;
      $("#prices").text(`${item}`)
      var item = price - ( price * 0.10);
      $("#profit").text(`${item}`)
    })
    .fail(function() {
    alert('半角数字のみ入力可能');
    });
  })
})