import React from 'react'
import TableRow from './TableRow'

const Table = props => (
  <table className="table">
    <thead>
      <tr>
        <th style={{width: '20%'}}>Image</th>
        <th style={{width: '20%'}}>Listing</th>
        <th style={{width: '20%'}}>Location</th>
        <th style={{width: '20%'}}>Details</th>
      </tr>
    </thead>
    <tbody>
      { props.listings.map((listing, index) => (
        <TableRow key={index} {...listing} />
      ))}
    </tbody>
  </table>
)

export default Table
