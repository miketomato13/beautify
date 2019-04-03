import React from 'react'

const TableRow = props => (
  <tr id={`/listings/${props.id}`}>
  <td>
    <img className={props.images} src={props.images} style= {{width: '75px'}}/>
  </td>
  <td>
    <span className={props.title}>
      {props.title}
    </span>
  </td>
    <td>
      <span className={props.city}>
        {props.city}
      </span>
    </td>
    <td>
    <a href={`/listings/${props.id}`} className="btn btn-dark">
      Details
    </a>
    </td>
  </tr>
)

export default TableRow
