/*
	Filterscript criada por Carlos Victor - 06/10/2021

	Filterscript atualizado - 21/03/2023
	Update:
	Foi adicionado /savepos em veículos. - 11/10/2021 - CarlosCV
	Transferido para open.mp - 21/03/2023 - pushline

	Comandos:
	/savepos [Comentário (Opcional)]

	Syntax:

	A pé:
	SkinID, PosX, PosY, PosZ, Angle, InteriorID, VirtualWorldID // Comentário

	Em veículo:
	VehID, PosX, PosY, PosZ, Angle, InteriorId, VehicleVirtualWorld // Comentário

	GitHub: https://github.com/CarlinCV/SavePosition-SA-MP
	Fórum: https://portalsamp.com/showthread.php?tid=1684

*/

// open.mp
#define FILTERSCRIPT
#include <open.mp>


// YSI Includes - nightly build. - https://github.com/pawn-lang/YSI-Includes/releases/tag/nightly
#define YSI_NO_CACHE_MESSAGE
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_HEAP_MALLOC

#include <YSI_Visual\y_commands>

#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#if defined FILTERSCRIPT

main(){
	print("[SavePosition] Carregado com sucesso!");
}

@cmd() savepos(playerid, params[], help)
{
	new Float:P[4], Float:V[4], String[256];
	GetPlayerPos(playerid, P[0], P[1], P[2]);
	GetPlayerFacingAngle(playerid, P[3]);

	new File:log = fopen("savedpositions.txt", io_append);
	if(isnull(params))
	{ 		
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			GetVehiclePos(vehicleid, V[0], V[1], V[2]);
			GetVehicleZAngle(vehicleid, V[3]);

			format(String, sizeof(String), "%d, %f, %f, %f, %f, %d, %d //\r\n", GetVehicleModel(vehicleid), V[0], V[1], V[2], V[3], GetPlayerInterior(playerid), GetVehicleVirtualWorld(vehicleid));

			fwrite(log, String);
			fclose(log);

			SendClientMessage(playerid, 0x88AA62AA, "[SavePosition] Vehicle coords were saved!");
			return 1;
		}

		format(String, sizeof(String), "%d, %f, %f, %f, %f, %d, %d //\r\n", GetPlayerSkin(playerid), P[0], P[1], P[2], P[3], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));

		fwrite(log, String);
		fclose(log);
	}
	else
	{ 
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			GetVehiclePos(vehicleid, V[0], V[1], V[2]);
			GetVehicleZAngle(vehicleid, V[3]);

			format(String, sizeof(String), "%d, %f, %f, %f, %f, %d, %d // %s\r\n", GetVehicleModel(vehicleid), V[0], V[1], V[2], V[3], GetPlayerInterior(playerid), GetVehicleVirtualWorld(vehicleid), params);

			fwrite(log, String);
			fclose(log);

			SendClientMessage(playerid, 0x88AA62AA, "[SavePosition] Vehicle coords were saved!");
			return 1;
		}

		format(String, sizeof(String), "%d, %f, %f, %f, %f, %d, %d // %s\r\n", GetPlayerSkin(playerid), P[0], P[1], P[2], P[3], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), params);

		fwrite(log, String);
		fclose(log);
	}

	SendClientMessage(playerid, 0x88AA62AA, "[SavePosition] Player coordinates on foot were saved!");
	return 1;
}

#endif