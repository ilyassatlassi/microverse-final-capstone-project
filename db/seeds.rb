Doctor.delete_all

doctors_array = [
  Doctor.new(
    image: "image_url_1",
    name: "Dr. John Doe",
    specialization: "Cardiologist",
    consultation_fee: 150,
    hospital: "City Hospital",
    availability: true,
    description: "Experienced cardiologist with a focus on heart health.",
    facebook: "facebook.com/johndoe",
    twitter: "twitter.com/johndoe",
    instagram: "instagram.com/johndoe"
  ),
  Doctor.new(
    image: "image_url_2",
    name: "Dr. Jane Smith",
    specialization: "Dermatologist",
    consultation_fee: 120,
    hospital: "Skin Clinic",
    availability: true,
    description: "Skincare expert specializing in dermatological treatments.",
    facebook: "facebook.com/janesmith",
    twitter: "twitter.com/janesmith",
    instagram: "instagram.com/janesmith"
  ),
  Doctor.new(
    image: "image_url_3",
    name: "Dr. Michael Johnson",
    specialization: "Orthopedic Surgeon",
    consultation_fee: 200,
    hospital: "OrthoCare Hospital",
    availability: false,
    description: "Orthopedic surgeon with expertise in joint replacements.",
    facebook: "facebook.com/michaeljohnson",
    twitter: "twitter.com/michaeljohnson",
    instagram: "instagram.com/michaeljohnson"
  ),
  Doctor.new(
    image: "image_url_4",
    name: "Dr. Sarah Lee",
    specialization: "Pediatrician",
    consultation_fee: 100,
    hospital: "Kids Care Clinic",
    availability: true,
    description: "Specializes in providing care for children and adolescents.",
    facebook: "facebook.com/drsarahlee",
    twitter: "twitter.com/drsarahlee",
    instagram: "instagram.com/drsarahlee"
  ),
  Doctor.new(
    image: "image_url_5",
    name: "Dr. Emily Wilson",
    specialization: "Gynecologist",
    consultation_fee: 180,
    hospital: "Women's Health Center",
    availability: true,
    description: "Dedicated to women's reproductive health and wellness.",
    facebook: "facebook.com/dremilywilson",
    twitter: "twitter.com/dremilywilson",
    instagram: "instagram.com/dremilywilson"
  ),
  Doctor.new(
    image: "image_url_6",
    name: "Dr. Thomas Anderson",
    specialization: "Neurologist",
    consultation_fee: 220,
    hospital: "Brain and Nerve Clinic",
    availability: true,
    description: "Expert in diagnosing and treating neurological disorders.",
    facebook: "facebook.com/dranderson",
    twitter: "twitter.com/dranderson",
    instagram: "instagram.com/dranderson"
  ),
  Doctor.new(
    image: "image_url_7",
    name: "Dr. Robert Johnson",
    specialization: "Ophthalmologist",
    consultation_fee: 160,
    hospital: "Eye Care Center",
    availability: true,
    description: "Specializes in eye-related diseases and surgeries.",
    facebook: "facebook.com/drobertjohnson",
    twitter: "twitter.com/drobertjohnson",
    instagram: "instagram.com/drobertjohnson"
  ),
  Doctor.new(
    image: "image_url_8",
    name: "Dr. Jennifer Adams",
    specialization: "Psychiatrist",
    consultation_fee: 190,
    hospital: "Mindful Psychiatry Clinic",
    availability: false,
    description: "Offers compassionate care for mental health and well-being.",
    facebook: "facebook.com/drjenniferadams",
    twitter: "twitter.com/drjenniferadams",
    instagram: "instagram.com/drjenniferadams"
  ),
  Doctor.new(
    image: "image_url_9",
    name: "Dr. William Roberts",
    specialization: "General Surgeon",
    consultation_fee: 180,
    hospital: "City General Hospital",
    availability: true,
    description: "Experienced in various surgical procedures and emergency care.",
    facebook: "facebook.com/drwilliamroberts",
    twitter: "twitter.com/drwilliamroberts",
    instagram: "instagram.com/drwilliamroberts"
  ),
  Doctor.new(
    image: "image_url_10",
    name: "Dr. Elizabeth Turner",
    specialization: "Endocrinologist",
    consultation_fee: 210,
    hospital: "Metabolic Health Clinic",
    availability: true,
    description: "Specializes in hormone-related disorders and diabetes management.",
    facebook: "facebook.com/drelizabethturner",
    twitter: "twitter.com/drelizabethturner",
    instagram: "instagram.com/drelizabethturner"
  )
]


doctors_array.each do |doctor|
  doctor.save!
end
