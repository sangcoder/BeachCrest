<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

final class RoleType extends Enum
{
  // 3 nhóm quyền 
  const ADMINISTRATOR = 'admin';
  const MODERATOR = 'mod';
  const MEMBER = 'member';
}
