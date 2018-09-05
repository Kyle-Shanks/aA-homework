import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchInput: "" }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.fetchGiphys('dancing');
  }

  handleChange(event) {
    this.setState({searchInput: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.fetchGiphys(this.state.searchInput).then(() => {
      this.setState({searchInput: ''});
    });
  }

  render() {
    return (
      <div className="giphy-search-container">
        <form onSubmit={this.handleSubmit}>
          <input type="text" onChange={this.handleChange} value={this.state.searchInput}/>
          <input type="submit" value="Search" />
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
