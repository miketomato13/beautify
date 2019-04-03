import React from 'react'

const TableRow = props => (
  <tr id={`/profiles/${props.artist.user_id}`}>
  <td>
    <img className="artistAvatar" src={props.artist.avatar} style= {{width: '75px'}}/>
  </td>
  <td>
    <span className={props.artist.name}>
      {props.artist.name}
    </span>
  </td>
    <td>
      <span className={props.artist.location}>
        {props.artist.location}
      </span>
    </td>
    <td>
    <a href={`/profiles/${props.artist.user_id}`} className="btn btn-dark">
      Details
    </a>
    </td>
  </tr>
)

export default TableRow
