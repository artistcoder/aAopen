import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    }
    //your code here
  }

  //your code here
  setNum1(e) {
    this.setState({num1: e.currentTarget.value});
  }
  setNum2(e) {
    this.setState({num2: e.currentTarget.value});
  }
  //
  // handleAdd(e) {
  //   e.preventDefault();
  //   this.setState({result: this.state.num1 + this.state.num2})
  // };

  

  render(){
    return (
      <div>
        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>
        // <input type="submit" onClick={this.handleAdd}>+</input>

        );
      </div>
    );
  }
}

export default Calculator;
