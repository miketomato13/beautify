import React from 'react';



const Search = props => (
  <div className="form-group">
    <form onSubmit={props.handleSearch}>
      <input
        id="term"
        type="text"
        className="col-xs-4"
        placeholder="Search"
        autoComplete="off"
        name="query"
        />
      <button type="submit" className="btn btn-dark">
            Submit
      </button>
    </form>
  </div>



)


export default Search
