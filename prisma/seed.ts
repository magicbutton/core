import prisma from '@/prisma';

async function roles() {
	await prisma.userRole.create({
		data: {
			name: 'superadmin',
			description: 'Super Admin',
			tenant: 'default',
		},
	});
	await prisma.userRole.create({
		data: {
			name: 'ring1',
			description: 'Ring 1',
			tenant: 'default',
		},
	});
	await prisma.userRole.create({
		data: {
			name: 'dev',
			description: 'Developer',
			tenant: 'default',
		},
	});

	console.log('done');
}
async function connectToles() {
	await prisma.userProfile.update({
		where: { id: 1 },
		data: {
			roles: {
				connect: [{ id: 1 }, { id: 2 }, { id: 3 }],
			},
		},
	});

	console.log('done');
}

//roles();
connectToles();
