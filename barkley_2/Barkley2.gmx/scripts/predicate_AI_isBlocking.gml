if (predicate_AI_isWading(id)) {
    return false;
}

if (!isCombatActor(id)) {
    return false;
}

return id.is_blocking;
