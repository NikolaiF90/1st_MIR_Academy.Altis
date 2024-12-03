class F90
{
    class Core 
    {
        file = "Functions\Core";
        class AssignAsContainer {};
        class CloseDialog {};
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
        class InitAO {};
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
    class Survival 
    {
        file = "Functions\Survival";
        class AssignAsCoffeeMachine {};
        class AssignAsStove {};
        class InitSurvival {};
        class PrepareFood {};
    };
    class Utils
    {
        file = "Functions\Utils";
        class addAction {};
        class addActionX {};     
        class CreateAO {};
        class Debug {};
        class GetGroupList {};
        class globalExecute {};
        class PopulateListBox {};
        class respawnVehicle {};
        class TeleportObject {};
    };
};