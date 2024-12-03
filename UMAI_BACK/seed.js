const sequelize = require('./config/db');  // Import the sequelize instance
const Restaurant = require('./models/restaurant');  // Import the Restaurant model

const seedData = async () => {
  try {
    // Sync the database first to create the tables
    await sequelize.sync();  // This is the correct way to call it

    // Seed data
    await Restaurant.bulkCreate([
      {
        name: 'Sushi Haven',
        address: '123 Tokyo Ave, Sushi City',
        taste: 5,
        price: 4,
        quantity: 3,
        accessibility: 3,
        ambiance: 4,
        description: 'Enjoy authentic sushi with fresh ingredients.',
        createdAt: new Date(),
        updatedAt: new Date(),
      },
      {
        name: 'Pasta Paradise',
        address: '456 Italy St, Rome',
        taste: 4,
        price: 3,
        quantity: 5,
        accessibility: 5,
        ambiance: 3,
        description: 'Experience Italian home-cooked pasta.',
        createdAt: new Date(),
        updatedAt: new Date(),
      },
      {
        name: 'Burger Blast',
        address: '789 Burger Ln, FastFood Town',
        taste: 3,
        price: 2,
        quantity: 4,
        accessibility: 4,
        ambiance: 2,
        description: 'Gourmet burgers for every taste.',
        createdAt: new Date(),
        updatedAt: new Date(),
      },
    ]);

    console.log('Mock data seeded successfully');
  } catch (error) {
    console.error('Error seeding data:', error);
  }
};

seedData();