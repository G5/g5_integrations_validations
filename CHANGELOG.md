# 7.2.0

- Add `more_information` CTA type
- Add `call_met` and `inquiry_met` to CentershiftInventoryValidations::CTAS_THRESHOLD_OPTIONS

# 7.1.1

- Change `rent_now_or_quote` to `rent_now_or_inquiry` for consistency with inquiry CTA

# 7.1.0

- Add to possible SiteLink CTA values

# 7.0.0

- Remove RealPage `apartment_selection` validations

# 6.0.0

- Rename `unit_availability_threshold` to `unit_cta_availability_threshold`

# 5.0.0

- Rename RealPage `apartment_availability_basis` to `apartment_selection`

# 4.0.0

- Add validations for RealPage `apartment_availability_basis`

# 3.0.0

- Breaking change: rename `YardiVoyagerInventoryRateSourceValidations` to `MultiFamilyInventoryRateSourceValidations`

# 2.0.0

- Breaking change: merge `YardiRentCafeInventoryRateToDisplayValidations` and `YardiVoyagerInventoryRateToDisplayValidations` into `MultiFamilyInventoryRateToDisplayValidations`

# 1.9.0

- Yardi RentCafe validations

# 1.8.1

- Refactor RealPage CTA settings

# 1.8.0

- `unit_availability_cta_2_in_and_above_threshold` and `unit_availability_cta_below_threshold` are always required and have all options

# 1.7.2

Modified RealPage validations
Added unit_availability_cta_2_in_and_above_threshold validations
Added unit_availability_cta_2_below_threshold validations

# 1.7.1

Added RealPage settings validations

# 1.7.0

- Add Centershift call threshold to options
- Add Centershift "CTA 2" validations

# 1.5.1

Changed StartingRateSource to RateSource

# 1.5.0

Added YardiVoyagerInventoryRateToDisplayValidations

# 1.4.0

Added starting rate source inventory validations for YardiVoyagerInventory

# 1.3.3

- Split CTA validations and Inventory credential validations for YardiVoyagerInventory

# 1.3.2

- Add cta_reservation_url for YardiVoyagerInventory

# 1.3.1

- Add cta and threshold validations for YardiVoyagerInventory

# 1.3.0

- Use new CTA values for Centershift

# 1.2.1

- Removed unused YardiVoyagerInventoryValidations (originating_lead_source, reasons)

# 1.2.0

- Added YardiVoyagerInventoryValidations

# 1.0.1

- Fix dependency:
  - SiteLinkInventoryCtaThresholdValidations and SiteLinkInventoryCtaUrlValidations
    should come first before SiteLinkInventoryPresenceValidations

# 1.0.0

- First official production version
