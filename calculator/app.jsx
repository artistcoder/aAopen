import React from 'react';
import ReactDOM from 'react-dom';

import Calculator from './calculator';

document.addEventListener('DOMContentLoaded', function () {
  ReactDOM.render(<Calculator />, document.getElementById('main'));
});

const handleClick = event => {
	event.preventDefault();
	alert("clicked!");
};

const SimpleButton = () => (
  <input type="submit" onClick={handleClick}>Click Me!</input>
);
