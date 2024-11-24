class F90
{
    class Core 
    {
        file = "Functions\Core";
        class AssignAsContainer {};
        class makeRespawnable {};
        class moveOut {};
        class startRpgPractice {};
        class startRiflePractice {};
    };
    class Headless
    {
        file = "Functions\Headless";
        class executeServer {};
        class executeServerX {};
    };
    class Init 
    {
        file = "Functions\Init";
        class initHeadless {};
        class initHeadlessVariables {};
        class initPlayer {};
        class initServer {};
        class initServerVariables {};
    };
    class Roadblocks
    {
        file = "Functions\Roadblocks";
        class arrest {};
        class deleteRBVehicles {};
        class endRoadblock {};
        class generateRandomClass {};
        class initRoadblock {};
        class OrderGetOut {};
        class orderToProceed {};
        class seizeVehicle {};
        class setVehicleCargo {};
        class spawnRBVehicle {};
        class startRoadblock {};
        class vehicleHandler {};
    };
    class Utils
    {
        file = "Functions\Utils";
        class addAction {};
        class addActionX {};
        class debug {};
        class globalExecute {};
        class respawnVehicle {};
    };
};