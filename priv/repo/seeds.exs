# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Jototter.Repo.insert!(%Jototter.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias Jototter.User
alias Jototter.Note
alias Jototter.Tag
alias Jototter.NoteTag

Jototter.Repo.delete_all(Tag)
Jototter.Repo.delete_all(Note)
Jototter.Repo.delete_all(User)
Jototter.Repo.delete_all(NoteTag)


user_ethan = Jototter.Repo.insert!(%User{
    first_name: "Ethan", 
    last_name: "Brady", 
    email: "ethanthomasbrady@gmail.com"
})

user_testie = Jototter.Repo.insert!(%User{
    first_name: "Testie", 
    last_name: "McTesterson", email: "test@test.com"
})
 
note1 = Jototter.Repo.insert!(%Note{
    text: "This is a test note",
    user: user_ethan
})

tag1 = Jototter.Repo.insert!(%Tag{
    label: "Important",
    user:  user_ethan
})

note1_tag1 = Jototter.Repo.insert!(%NoteTag{
    note: note1,
    tag: tag1
})