module CoachingProgramsHelper
  def coaching_program_data(entity)
    entity.coaching_programs.collect { |c| [c.name, c.id] }
  end
end
