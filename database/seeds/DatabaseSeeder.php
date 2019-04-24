<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(RolesAndPermissionsSeeder::class);
        // factory(App\Model\Place::class, 20)->create();
        factory(App\Model\Scenic_Culture::class, 30)->create();
    }
}
