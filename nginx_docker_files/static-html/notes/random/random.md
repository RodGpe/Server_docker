# Random thoughts

## 30/12/21

Today I´m starting this part of my site where I´m planning to dump some thoughts, daily experiences, learnings and random facts. I´m doing this for the sake of practicing my english writing and to keep a record of my jorney through this life. As my first publication I want to tell de word that I was very skeptical about mechanical keyboards, but that changed today with the arrival of my first mechanical keyboard, it´s actually very nice to not need to apply much force and energy to press a key. The keyboard I ordered is one with blue switches, my first impresion was that it´s heavier than I initially thought. I´m goint to keep using it and probably write another post later with more experience using it daily. I´m concern that no one is going to see this posts and that the mistakes I make in this wording go unnoticed. As of today I´m using VScode as a text editor, I need to search if there is any way to customize it in order to make the spellchecking. Another thing I'm think about is to keep coding, maybe use a framework for my webpage or maybe star using javascript more, client side and server side.

## 01/12/21

Yesterday I didn't have time to write so I will write my thoughts of today and of yesterday. Yesterday I was thinking that in my first publication in this page I didn't write one thing that I learned the 30th, it was on that day when I learn that it is posible to install VScode in windows even when you don't have administrative privilege. That is a huge thing for me because I been using it for quite some time, it's very complete, it has a lot of support and with a big community and it's multiplatform so I use in my personal laptop and in the company's laptop. The way I write and publish this posts is the following: I rent a VPS (Virtual Private Server) on DigitalOcean, they provide me with a public IP, then I pay for a public domain in GoDaddy and use their DNS service to link my domain (rodgpe.com) to the public IP given to me by Digital Ocean. Once I have that I install docker in my VPS, which uses Ubuntu, in docker I configure all my services that my VPS uses. As of today only has two services, an nginx service and a node service. It's on the nginx server were I post this, I write the posts in Markdown and use the Marked.js to render it to html. The other container I use it to play with NodeJS. 

## 01/03/22

Today I learn that in the networking layer model, the application model has at its disposal the services that the trasportation layer offers. Some of this servies are, 
- Reliable trasportation
- Speed transfer
- Timing
- Security

