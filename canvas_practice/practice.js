document.addEventListener("DOMContentLoaded", function(){
  const canvasEx = document.getElementById('mycanvas');
  canvasEx.height = 500;
  canvasEx.width = 500;
  const ctx = canvasEx.getContext('2d');
  ctx.fillStyle = "red";
  ctx.fillRect(20, 10, 150, 100);

  ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 10;
  ctx.stroke();

  ctx.fillStyle = "pink";
  ctx.fill();
});
