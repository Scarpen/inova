# Criação das Roles
r1 = Role.new
r1.name = "Admin"
r1.save
r2 = Role.new
r2.name = "Partaker"
r2.save
r3 = Role.new
r3.name = "Visitor"
r3.save

# Criação dos Profiles
p = Profile.new(name: "Manager")
p.save

p2 = Profile.new(name: "Collaborator")
p2.save

p3 = Profile.new(name: "Evaluator")
p3.save

# Criação dos Estágios dos Projetos
s = Stage.new
s.description = "Uma idéia já descrita com detalhamento das etapas do processo de desenvolvimento"
s.save
s1 = Stage.new
s1.description = "Um processo em fase de desenvolvimento, ainda não testado"
s1.save
s2 = Stage.new
s2.description = "Um processo já desenvolvido com protótipo testado e avaliado"
s2.save
s3 = Stage.new
s3.description = "Um produto e/ou serviço que já atende o mercado consumidor precisando de melhoria"
s3.save


# validates :full_name, :username, :phone, :rg,
# 	:issuing_agency, :issuing_date, :cpf, :birth_date,
# 	:nationality, :naturality, :residential_address,
# 	:cep, :city, :formation, :course, :institution,
# 	:job, presence: true

adm = User.create!(email: "administrador@fabsoft.com", password: "123123", 
	password_confirmation: "123123", full_name: "Administrador",
	phone: "9312331", rg: "38471837", issuing_date: Time.now, cpf: "19028390123",
	birth_date: Time.now, nationality: "Brasil", naturality: "Brasil",
	residential_address: "sakdjllskdja", cep: "24782734", city: "Belem", formation: "alksjda",
	course: "çaskjdasd", institution: "Cesupa", job: "ADM", issuing_agency: "SSP-PA"
	)
adm.role = r1
adm.confirm!
adm.save