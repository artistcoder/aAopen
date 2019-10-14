function hammerTime(time) {
  window.setTimeout(function(){
    alert(`${time} is HAMMERTIME`);
  }, 5000)
}

window.setTimeout(function() {
  alert('HAMMERTIME');
}, 5000);
