class <%=singular_name.titleize%>DataTable

  delegate :params, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options={})
    {
        recordsTotal: count,
        recordsFiltered: total_entries,
        data: data
    }
  end

  def data
    <%=plural_name%>.map.with_index(((page-1) * params[:length].to_i)+1) do |data,index|
      [].tap do |column|
        column << index
        column << data.title
        column << data.age
        column << data.name
        column << "<span><a href='/#{data}s/#{data.id}'><i class='fa fa-eye text-secondary'></i></a><a href='/#{data}s/#{data.id}/edit'><i class='fa fa-edit text-primary mx-1'></i></a><a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/#{data}s/#{data.id}'><i class='fa fa-trash text-danger'></i></a></span>"
      end
    end
  end

  def total_entries
    <%=plural_name%>.total_count
  end

  def count
    <%=singular_name.titleize%>.count
  end

  def page
    params[:start].to_i / per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def books
    @<%=plural_name%> ||= fetch_book
  end

  def fetch_book
    search_string = []
    columns.each do |term|
      search_string << "#{term} like :search"
    end

    datas = <%=singular_name.titleize%>.page(page).per(per_page)
    datas = datas.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def columns
    self.args
  end
end