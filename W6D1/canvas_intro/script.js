// - Canvas Setup -
const cnv = document.getElementById('cnv');
const ctx = cnv.getContext('2d');
cnv.height = window.innerHeight;
cnv.width = window.innerWidth;

// - Window Resize Listener -
window.addEventListener('resize', function() {
  cnv.height = window.innerHeight;
  cnv.width = window.innerWidth;
  coverFrame(1);
});

// - Colors -
const colorArr = ['#ff3c41', '#b9f', '#0ebeff', '#ffdd40', '#47cf73', '#ff813f'];

// - Particle Class -
class Particle{
  constructor(x,y,color) {
    this.x = x;
    this.y = y;
    this.vx = (Math.random() * 10) - 5;
    this.vy = (Math.random() * 10) - 5;
    this.vx = (this.vx && this.vy) ? this.vx : 3;
    this.color = color || colorArr[ Math.floor(Math.random() * colorArr.length) ];
    this.r = Math.floor(Math.random() * 6) + 3;
  }

  move() {
    this.x += this.vx;
    this.y += this.vy;
    this.boundaryCheck();
  }

  boundaryCheck() {
    // X Check
    if(this.x < 0) { this.x = 0; this.vx *= -1; }
    if(this.x > cnv.width) {  this.x = cnv.width; this.vx *= -1; }
    // Y Check
    if(this.y < 0) { this.y = 0; this.vy *= -1; }
    if(this.y > cnv.height) {  this.y = cnv.height; this.vy *= -1; }
  }

  draw() {
    ctx.fillStyle = this.color || '#CCC';
    ctx.beginPath();
    ctx.arc(this.x,this.y,this.r,0,2*Math.PI);
    ctx.fill();
  }
}

// Array for the particles
const particles = [];

// - Functions -
function setup() {
  particles.length = 0;
  for(let i = 0; i < 30; i++) {
    particles.push(new Particle( Math.floor(Math.random() * cnv.width),  Math.floor(Math.random() * cnv.height)));
  }
}

function run() {
  coverFrame(1);
  setup();
  frameFunction();
}

function frameFunction() {
  coverFrame(0.1);
  particles.forEach( p => {
    p.move();
    p.draw();
  });
  requestAnimationFrame(frameFunction);
}

function coverFrame(op) {
  ctx.fillStyle = `rgba(0,0,0,${op})`;
  ctx.fillRect(0,0,cnv.width,cnv.height);
}

run(); // Go Time!
