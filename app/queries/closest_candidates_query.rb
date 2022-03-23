# frozen_string_literal: true

class ClosestCandidatesQuery
  def closest_candidates(n_records: 5, min_zone_dist: 0.3, max_zone_dist: 10.0, min_mass: 0.6, max_mass: 2.0)
    Planet
      .includes(:star)
      .rocky.habitable_zone(min_zone_dist, max_zone_dist)
      .gravity_acceptable(min_mass, max_mass)
      .non_synchronized_rotation
      .order_by_stars_distance_from_earth
      .limit(n_records)
  end
end
