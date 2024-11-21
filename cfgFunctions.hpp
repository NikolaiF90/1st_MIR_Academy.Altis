class F90
{
    class Core 
    {
        file = "Functions\Core";
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
    class Utils
    {
        file = "Functions\Utils";
        class addAction {};
        class addActionX {};
        class debug {};
        class respawnVehicle {};
    };
};