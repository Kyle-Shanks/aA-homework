import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      num1: '',
      num2: '',
      result: 0
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.operation = this.operation.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(event) {
    this.setState({num1: Number(event.target.value)});
  }
  setNum2(event) {
    this.setState({num2: Number(event.target.value)});
  }

  operation(event) {
    const op = event.target.innerText;
    const n1 = this.state.num1;
    const n2 = this.state.num2;
    this.setState({result: eval(`${n1} ${op} ${n2}`)});
  }

  clear() {
    this.setState({ num1: '', num2: '', result: 0 });
  }

  render() {
    return (
      <div className="calculator">
        <h1>{this.state.result}</h1>

        <input onChange={this.setNum1} type="text" value={this.state.num1}
          placeholder="Enter the first number"></input>
        <input onChange={this.setNum2} type="text" value={this.state.num2}
          placeholder="Enter the second number"></input>
        <button type="button" onClick={this.clear}>Clear</button>
        <br />

        <button type="button" onClick={this.operation}>+</button>
        <button type="button" onClick={this.operation}>-</button>
        <button type="button" onClick={this.operation}>*</button>
        <button type="button" onClick={this.operation}>/</button>
      </div>
    );
  }
}

export default Calculator;
