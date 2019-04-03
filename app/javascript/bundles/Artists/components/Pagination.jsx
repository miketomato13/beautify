import React from 'react'

const Pagination = props => (
  <div className="btn-toolbar" role="toolbar">
    <div className="btn-group mr-2" role="group">
      <button
        className="btn btn-secondary"
        onClick={ () => { props.changePage(1) } }
        rel="first"
      >
        First
      </button>
    </div>
    <div className="btn-group mr-2" role="group">
      <button
        className="btn btn-light"
        onClick={ () => { props.changePage(props.page - 1) } }
        disabled={ props.page === 1 }
        rel="prev"
      >
        Prev
      </button>
      <button
        className="btn btn-light"
        onClick={ () => { props.changePage(props.page + 1) } }
        disabled={ props.page === props.totalPages }
        rel="next"
      >
        Next
      </button>
    </div>
    <div className="btn-group mr-2" role="group">
      <button
        className="btn btn-secondary"
        onClick={ () => { props.changePage(props.totalPages) } }
        rel="last"
      >
        Last
      </button>
    </div>
    <div className="btn-group" role="group">
      <div style={{margin: '.375 rem'}}>
        Page {props.page} of {props.totalPages}
      </div>
    </div>
  </div>
)

export default Pagination
