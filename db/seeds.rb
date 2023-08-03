Reservation.delete_all
User.delete_all
Doctor.delete_all

users = [
  User.new(
    name: 'Emily Smith',
    nickname: 'emilys',
    email: 'emilysmith@gmail.com',
    password: 'emily123'
  ),
  User.new(
    name: 'Michael Johnson',
    nickname: 'mjohnson',
    email: 'michaeljohnson@gmail.com',
    password: 'michael123'
  ),
  User.new(
    name: 'Sophia Lee',
    nickname: 'sophial',
    email: 'sophialee@gmail.com',
    password: 'sophia456'
  ),
  User.new(
    name: 'Administrator',
    nickname: 'admin',
    email: 'admin@gmail.com',
    password: 'admin456',
    role: 'admin'
  ),
  User.new(
    name: 'Administrator 2',
    nickname: 'admin',
    email: 'admin2@gmail.com',
    password: 'admin789',
    role: 'admin'
  )
]

doctors = [
  Doctor.new(
    image: "https://i.pinimg.com/564x/47/78/71/477871f7bdad4ca6e973e4bebde1d619.jpg",
    name: "Dr. John Doe",
    specialization: "Cardiologist",
    consultation_fee: 150,
    hospital: "City Hospital",
    availability: true,
    description: "Experienced cardiologist with...",
    facebook: "https://facebook.com/johndoe",
    twitter: "https://twitter.com/johndoe",
    instagram: "https://instagram.com/johndoe"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/72/b8/89/72b8890192ea78d25cf7e969453dc390.jpg",
    name: "Dr. Jane Smith",
    specialization: "Dermatologist",
    consultation_fee: 120,
    hospital: "Skin Clinic",
    availability: true,
    description: "Skincare expert specializing...",
    facebook: "https://facebook.com/janesmith",
    twitter: "https://twitter.com/janesmith",
    instagram: "https://instagram.com/janesmith"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/6a/af/47/6aaf47b8ee8d344f4cdda3d1bdcc45f3.jpg",
    name: "Dr. Michael Johnson",
    specialization: "Orthopedic Surgeon",
    consultation_fee: 200,
    hospital: "OrthoCare Hospital",
    availability: false,
    description: "Orthopedic surgeon with...",
    facebook: "https://facebook.com/michaeljohnson",
    twitter: "https://twitter.com/michaeljohnson",
    instagram: "https://instagram.com/michaeljohnson"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/1b/52/fd/1b52fd81c2282b432b85dc6a8a01f13d.jpg",
    name: "Dr. Sarah Lee",
    specialization: "Pediatrician",
    consultation_fee: 100,
    hospital: "Kids Care Clinic",
    availability: true,
    description: "Specializes in providing care...",
    facebook: "https://facebook.com/drsarahlee",
    twitter: "https://twitter.com/drsarahlee",
    instagram: "https://instagram.com/drsarahlee"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/1f/e4/b2/1fe4b22873d29a7babb1f7e5b52efed2.jpg",
    name: "Dr. Emily Wilson",
    specialization: "Gynecologist",
    consultation_fee: 180,
    hospital: "Women's Health Center",
    availability: true,
    description: "Dedicated to women's reproductive...",
    facebook: "https://facebook.com/dremilywilson",
    twitter: "https://twitter.com/dremilywilson",
    instagram: "https://instagram.com/dremilywilson"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/92/33/24/923324c031d8ba5da741fd2ef63306e3.jpg",
    name: "Dr. Thomas Anderson",
    specialization: "Neurologist",
    consultation_fee: 220,
    hospital: "Brain and Nerve Clinic",
    availability: true,
    description: "Expert in diagnosing and treating...",
    facebook: "https://facebook.com/dranderson",
    twitter: "https://twitter.com/dranderson",
    instagram: "https://instagram.com/dranderson"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/eb/00/f4/eb00f433d6ae7cecdecffaacdb963fcf.jpg",
    name: "Dr. Robert Johnson",
    specialization: "Ophthalmologist",
    consultation_fee: 160,
    hospital: "Eye Care Center",
    availability: true,
    description: "Specializes in eye-related...",
    facebook: "https://facebook.com/drobertjohnson",
    twitter: "https://twitter.com/drobertjohnson",
    instagram: "https://instagram.com/drobertjohnson"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/0f/65/5a/0f655a106416d94690749a1960516938.jpg",
    name: "Dr. Jennifer Adams",
    specialization: "Psychiatrist",
    consultation_fee: 190,
    hospital: "Mindful Psychiatry Clinic",
    availability: false,
    description: "Offers compassionate care...",
    facebook: "facebook.com/drjenniferadams",
    twitter: "https://twitter.com/drjenniferadams",
    instagram: "https://instagram.com/drjenniferadams"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/e8/f9/64/e8f964f2a79487c2bc9515b193be19e3.jpg",
    name: "Dr. William Roberts",
    specialization: "General Surgeon",
    consultation_fee: 180,
    hospital: "City General Hospital",
    availability: true,
    description: "Experienced in various...",
    facebook: "https://facebook.com/drwilliamroberts",
    twitter: "https://twitter.com/drwilliamroberts",
    instagram: "https://instagram.com/drwilliamroberts"
  ),
  Doctor.new(
    image: "https://i.pinimg.com/564x/0c/49/08/0c49085f860988e12ab31c02bc0ff134.jpg",
    name: "Dr. Elizabeth Turner",
    specialization: "Endocrinologist",
    consultation_fee: 210,
    hospital: "Metabolic Health Clinic",
    availability: true,
    description: "Specializes in hormone-related...",
    facebook: "https://facebook.com/drelizabethturner",
    twitter: "https://twitter.com/drelizabethturner",
    instagram: "https://instagram.com/drelizabethturner"
  )
]

users.each do |user|
  user.save!
end

doctors.each do |doctor|
  doctor.save!
end
