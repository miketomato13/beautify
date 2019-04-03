import React, { Component } from 'react'
import axios from 'axios'
import Table from './Table'
import Search from './Search'
import Pagination from './Pagination'

class Listings extends Component {
  state = {
    listing:      this.props.listing,
    id:           '',
    city:         '',
    page:          1,
    totalPages:    1,
    listings:     [{}, {}, {}, {}, {}],
    query:         ''
  }



  fetchCity = (city = "", page = "") => {
    let url = `/listings.json?` + ( city ? `city=${city.toLowerCase()}` : "") + "&" + ( page ? `page=${page}` : "")

      axios.get(url)
      .then(response => {
        const { listings, city, page, totalPages } = response.data
        this.setState({ listings, city, page, totalPages })
      })
  }


  handleSearch = event => {
    event.preventDefault()
    const query = event.target.query.value
    const { page } = this.state
    this.setState({ query })
    this.fetchCity( query, page )
  }

  changePage = page => {
    const { query } = this.state
    this.fetchCity( query, page )
  }


  render(){
    const { listings, city, query, page, totalPages } = this.state
    return(
      <div>
        <Search
          query={city}
          handleSearch={this.handleSearch}
          invalid={ query.length > 0 && query.length === 0 ? query : 'invalid' }
        />
         {this.state.query &&
        <Table listings={listings} />}
         {this.state.query &&
        <Pagination
          page={page}
          totalPages={totalPages}
          changePage={this.changePage}
        />}
      </div>
    )
  }

  componentDidMount(){
    const { listing, id, page } = this.state
    this.fetchCity()
  }
}

export default Listings
