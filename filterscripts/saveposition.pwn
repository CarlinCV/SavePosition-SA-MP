//Filterscript criada por Carlos Victor - 06/10/2021
#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>

#if defined FILTERSCRIPT

main(){
	print("[Filterscript SavePosition] Carregado com sucesso!");
}

CMD:savepos(playerid, params[])
{
	new Float:P[4], String[256];
	GetPlayerPos(playerid, P[0], P[1], P[2]);
	GetPlayerFacingAngle(playerid, P[3]);

	new File:log = fopen("savedpositions.txt", io_append);
	if(isnull(params))
	{ 
		format(String, sizeof(String), "%d, %f, %f, %f, %f, %d, %d //\r\n", GetPlayerSkin(playerid), P[0], P[1], P[2], P[3], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));

		fwrite(log, String);
		fclose(log);
	}
	else
	{ 
		format(String, sizeof(String), "%d, %f, %f, %f, %f, %d, %d // %s\r\n", GetPlayerSkin(playerid), P[0], P[1], P[2], P[3], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), params);

		fwrite(log, String);
		fclose(log);
	}

	SendClientMessage(playerid, 0x88AA62AA, "[SavePosition] As coordenadas a pe foram salvadas!");
	return 1;
}

#endif
