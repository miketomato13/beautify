import React from 'react'
import TableRow from './TableRow'

const Table = props => (
  <table className="table">
    <thead>
      <tr>
        <th style={{width: '20%'}}>Avatar</th>
        <th style={{width: '20%'}}>Artist</th>
        <th style={{width: '20%'}}>Location</th>
        <th style={{width: '20%'}}>Details</th>
      </tr>
    </thead>
    <tbody>
      { props.artists.map((artist, index) => {
        return <TableRow key={index} artist={artist} />
      })}
    </tbody>
  </table>
)

export default Table
