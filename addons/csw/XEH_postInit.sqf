#include "script_component.hpp"

GVAR(vehicleMagCache) = call CBA_fnc_createNamespace;

["ace_settingsInitialized", {
    TRACE_2("settingsInit",GVAR(defaultAssemblyMode),GVAR(handleExtraMagazines));
    ["StaticWeapon", "init", LINKFUNC(staticWeaponInit), true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;


// Event handlers:
[QGVAR(disableVanillaAssembly), {
    params ["_staticWeapon"];
    TRACE_1("disableVanillaAssembly eh",_staticWeapon);
    _staticWeapon enableWeaponDisassembly false;
}] call CBA_fnc_addEventHandler;

[QGVAR(addTurretMag), LINKFUNC(reload_handleAddTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(removeTurretMag), LINKFUNC(reload_handleRemoveTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(returnAmmo), LINKFUNC(reload_hanldeReturnAmmo)] call CBA_fnc_addEventHandler;



#ifdef DEBUG_MODE_FULL
call compile preprocessFileLineNumbers QPATHTOF(functions\dev_checkStaticWeapons.sqf);
#endif