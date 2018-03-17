# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
DrillGroup.destroy_all
Drill.destroy_all
Solution.destroy_all
StudentDrillGroup.destroy_all
StudentDrill.destroy_all

PASSWORD = 'supersecret'

super_user = User.create(
  first_name: "Dwight",
  last_name: "Schrute",
  email: "beets@dundies.com",
  password: PASSWORD,
  is_admin: true
)

super_student = User.create(
  first_name: "Michael",
  last_name: "Scott",
  email: "boss@dundies.com",
  password: PASSWORD
)


5.times.each do
  g = DrillGroup.create(
    name: Faker::Book.title,
    description: Faker::HitchhikersGuideToTheGalaxy.quote,
    level: rand(1..3),
    max_points: rand(50..100),
    user: super_user,
    badge_name: Faker::RuPaul.queen
  )
  if g.valid?
    10.times.each do
      d = Drill.create(
        question: Faker::Simpsons.quote,
        drill_group: g
      )
      if d.valid?
        3.times.each do
          Solution.create(
            solution: Faker::TwinPeaks.quote,
            drill: d
          )
        end
      end
    end
  end
end

groups = DrillGroup.all
drills = Drill.all
solutions = Solution.all

puts "Created #{groups.count} drill groups, #{drills.count} drills, #{solutions.count} solutions!"

15.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  u = User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@email.com",
    password: PASSWORD
  )
  if u.valid?
    group = groups.sample

    g = StudentDrillGroup.create(
      user: u,
      drill_group: group
    )
    if g.valid?
      drills = group.drills
      for drill in drills
        StudentDrill.create(
          user: u,
          drill: drill,
          is_correct: Faker::Boolean.boolean(0.5)
        )
      end
    end
  end
end

students = User.where("id > 1")
student_drill_groups = StudentDrillGroup.all
student_drills = StudentDrill.all


puts "Created #{students.count} students with #{student_drills.count} drills from #{student_drill_groups.count} student drill groups"

puts "Log in as admin with email: #{super_user.email} password: #{super_user.password} or as student with email: #{super_student.email} password: #{super_student.password}. Have fun!"
