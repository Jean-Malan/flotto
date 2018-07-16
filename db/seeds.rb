# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


accounts = GlAccount.create([{code:"2001", name:"Accounting Fees", account_type:"operating_expense", user_id: 1}, 
{code:"2002", name:"Advertising Costs", account_type:"operating_expense", user_id: 1}, 
{code:"2003", name:"Bank Charges", account_type:"operating_expense", user_id: 1}, 
{code:"2004", name:"Cleaning", account_type:"operating_expense", user_id: 1}, 
{code:"2005", name:"Donations", account_type:"operating_expense", user_id: 1}, 
{code:"2006", name:"Entertainment", account_type:"operating_expense", user_id: 1}, 
{code:"2007", name:"Finance Charges", account_type:"operating_expense", user_id: 1}, 
{code:"2008", name:"Gifts", account_type:"operating_expense", user_id: 1}, 
{code:"2009", name:"Interest Paid", account_type:"operating_expense", user_id: 1}, 
{code:"2010", name:"Legal Fees", account_type:"operating_expense", user_id: 1}, 
{code:"2011", name:"Motor Vehicle - Feul", account_type:"operating_expense", user_id: 1}, 
{code:"2012", name:"Motor Vehicle - Repairs & Maintenance", account_type:"operating_expense", user_id: 1}, 
{code:"2013", name:"Office Supplies", account_type:"operating_expense", user_id: 1}, 
{code:"2014", name:"Staff Refreshment", account_type:"operating_expense", user_id: 1}, 
{code:"2015", name:"Printing & Stationary", account_type:"operating_expense", user_id: 1},
{code:"2015", name:"Rent", account_type:"operating_expense", user_id: 1}, 
{code:"2015", name:"Salaries & Wages", account_type:"operating_expense", user_id: 1}, 
{code:"2015", name:"Travel & Accommodation", account_type:"operating_expense", user_id: 1}])
