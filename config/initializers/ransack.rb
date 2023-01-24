require "ransack"

Ransack.configure do |config|

  config.custom_arrows = {
    up_arrow: '<div class="mt-1 ml-1 h-0 w-0 border-x-8 border-x-transparent border-b-[16px] border-b-blue-600"></div>',
    down_arrow: '<div class="mt-1 ml-1 h-0 w-0 border-x-8 border-x-transparent border-t-[16px] border-t-blue-600"></div>',
  }
  # Change default search parameter key name.
  # Default key name is :q
  config.search_key = :q

  # Raise errors if a query contains an unknown predicate or attribute.
  # Default is true (do not raise error on unknown conditions).
  config.ignore_unknown_conditions = false

  config.hide_sort_order_indicators = false
end
