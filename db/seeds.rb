# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create({email:'info@mice3.it', password: 'password', password_confirmation: 'password', role: 'admin'})

partner = Partner.create({name: "ulu b.v.", address: "New address", zip_code: "1000", city: "Ljubljtherland", country: "NL", attention_to: "Mr. Fix", vat: "20020220", footer_text: "Vat is excluded"})

project = Project.create({name: "ulu", description: "fdsa", content: "dfsadfasdfa", url: "dsfa", itunes_url: "", google_url: "", status: nil, partner_id: partner.id})

our_company = OurCompany.create({name: "Klemen s.p.", reference_number: "32993939393", address: "dfakjsdlfa", zip_code: "1000", city: "Ljubljana", country: "SI", trr: "SI01 0100 0101 0101 0101", bank: "dfsasdfasdfasdf", swift_bic_code: "3331d", contact_name: "Klemen", contact_phone: "3939393939", contact_email: "klemen@mice3.it", registration_number: "dfsadsfsdasd", vat_number: "dfasdfasdfa"})

invoice = Invoice.create({project_id: project.id, price: 1000, currency: "EUR", our_company_id: our_company.id, invoice_number: "2011-19", sent_at: "2015-04-22 00:00:00", storno: false, due_days: 8, status: "sent"})

InvoiceItem.create({invoice_id: invoice.id, description: "Programing", price: 1000, currency: "EUR", discount: false})
