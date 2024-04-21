<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('lowongan_magang', function (Blueprint $table) {
            $table->string('prodi', 255);
            $table->uuid('id_prodi')->nullable();
            $table->foreign('id_prodi')->references('id_prodi')->on('program_studi');
            $table->string('fakultas', 255);
            $table->uuid('id_fakultas')->nullable();
            $table->foreign('id_fakultas')->references('id_fakultas')->on('fakultas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('lowongan_magang', function (Blueprint $table) {
            //
        });
    }
};
