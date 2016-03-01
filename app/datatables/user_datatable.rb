class UserDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    @sortable_columns ||= %w(User.name  User.email)
  end

  def searchable_columns
    @searchable_columns ||= %w(User.name  User.email)
  end

  private

  def data
    records.map do |record|
      [
        record.name,record.email,record.role
      ]
    end
  end

  def get_raw_records
    User.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
