# Criação das Roles
r1 = Role.new
r1.name = "Admin"
r1.save
r2 = Role.new
r2.name = "Gestor"
r2.save
r3 = Role.new
r3.name = "Participante"
r3.save

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

# Criação das Proteções dos Projetos
p = Protection.new
p.description = "Patentes de Invenção (PI) – avanços do conhecimento técnico que combinem atividade inventiva e aplicação industrial. Validade: 20 anos"
p.save
p1 = Protection.new
p1.description = "Modelo de Utilidade (MU) – nova forma ou disposição de objeto de uso prático, com aplicação industrial, que represente melhoria funcional de produto ou processo já existente. Caracterizado como um ato inventivo. Validade: 15 anos"
p1.save
p2 = Protection.new
p2.description = "Registro de software - Validade: 50 anos"
p2.save