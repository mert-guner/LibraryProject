angular.module('HomeApp', [])
    .controller('HomeController', function ($scope, $http) {

        $scope.Name = "";
        $scope.SurName = "";
        $scope.TC = "";
        $scope.ISBN = "";
        $scope.BookName = "";
        $scope.PurchaseDate = new Date();
        $scope.DeliveryDate = "";
        $scope.Status = "";
        $scope.ID = 0;
        $scope.BookID = 0;
        $scope.PersonID = 0;

        $scope.search = function () {

            var code = $("#txtSearch").val();
            var StartDate = $("#datetimepicker1").val();
            var FinishDate = $("#datetimepicker2").val();
            var Status = parseInt($("#txtStatus").val());

            if (StartDate == '' || FinishDate == '') {
                iziToast.error({
                    title: 'Hata',
                    message: 'Lütfen Tarih Girin!',
                    position: 'topCenter'
                });
            }
            else {
                $http({
                    method: "POST",
                    url: "/Book/Search",
                    headers: { "Content-Type": "Application/json;charset=utf-8" },
                    data: { code: code, Start: StartDate, Finish: FinishDate, Status: Status }
                }).then(function (response) {
                    $scope.searchList = response.data;
                });
            }
        };

        $scope.Save = function () {

            var Name = $("#txtName").val();
            var Surname = $("#txtSurname").val();
            var TC = $("#txtTC").val();
            var BookName = $("#txtBookName").val();
            var ISBN = $("#txtISBN").val();
            var PurchaseDate = $("#datetimepicker3").val();
            var Status = parseInt($("#txtStatus").val());

            if (PurchaseDate == '') {
                iziToast.error({
                    title: 'Hata',
                    message: 'Lütfen Tarih Girin!',
                    position: 'topCenter'
                });
            }
            else {
                $http({
                    method: "POST",
                    url: "/Book/SaveBook",
                    headers: { "Content-Type": "Application/json;charset=utf-8" },
                    data: { BookName: BookName, ISBN: ISBN }
                }).then(function (response) {
                    $scope.bookID = parseInt(response.data);
                    $http({
                        method: "POST",
                        url: "/Person/SavePerson",
                        headers: { "Content-Type": "Application/json;charset=utf-8" },
                        data: { Name: Name, Surname: Surname, TC: TC }
                    }).then(function (response) {
                        $scope.personID = parseInt(response.data);
                        $http({
                            method: "POST",
                            url: "/Reservation/SaveReservation",
                            headers: { "Content-Type": "Application/json;charset=utf-8" },
                            data: { personID: $scope.personID, bookID: $scope.bookID, PurchaseDate: PurchaseDate }
                        }).then(function (response) {
                            iziToast.success({
                                title: 'Başarı',
                                message: 'Veriler Başarıyla Kaydedildi!',
                                position: 'topCenter'
                            });
                            $scope.clearPopUp();
                            $("#bookSavePopup").hide();
                           
                        });
                    });
                });
            }
        };



        $scope.Update = function () {

            var Name = $("#txtUpdateName").val();
            var Surname = $("#txtUpdateSurname").val();
            var TC = $("#txtUpdateTC").val();
            var BookName = $("#txtUpdateBookName").val();
            var ISBN = $("#txtUpdateISBN").val();
            var PurchaseDate = $("#Updatedatetimepicker4").val();
            var Status = parseInt($("#txtUpdateStatus").val());

            if (PurchaseDate == '') {
                iziToast.error({
                    title: 'Hata',
                    message: 'Lütfen Tarih Girin!',
                    position: 'topCenter'
                });
            }
            else {
                $http({
                    method: "POST",
                    url: "/Book/UpdateBook",
                    headers: { "Content-Type": "Application/json;charset=utf-8" },
                    data: { ID: $scope.BookID, BookName: BookName, ISBN: ISBN}
                }).then(function (response) {
                    $http({
                        method: "POST",
                        url: "/Person/UpdatePerson",
                        headers: { "Content-Type": "Application/json;charset=utf-8" },
                        data: { ID: $scope.PersonID, Name: Name, Surname: Surname, TC: TC }
                    }).then(function (response) {
                        $http({
                            method: "POST",
                            url: "/Reservation/UpdateReservation",
                            headers: { "Content-Type": "Application/json;charset=utf-8" },
                            data: { ID: $scope.ID, PersonID: $scope.PersonID, bookID: $scope.BookID, PurchaseDate: PurchaseDate, Status: Status }
                        }).then(function (response) {
                            iziToast.success({
                                title: 'Başarı',
                                message: 'Veriler Başarıyla Kaydedildi!',
                                position: 'topCenter'
                            });
                            $("#ModalUpdate").hide();
                            $scope.search();
                            $scope.clearPopUp();
                        });
                    });
                });
            }
        };

        $scope.selectedBook = function (id) {
                $http({
                    method: "POST",
                    url: "/Book/SelectedBook",
                    headers: { "Content-Type": "Application/json;charset=utf-8" },
                    data: { id: id }
                }).then(function (response) {
                    $scope.Name = response.data.Name;
                    $scope.SurName = response.data.SurName;
                    $scope.TC = response.data.TC;
                    $scope.ISBN = response.data.ISBN;
                    $scope.BookName = response.data.BookName;
                    $scope.PurchaseDate = response.data.PurchaseDate;
                    $scope.DeliveryDate = response.data.DeliveryDate;
                    $scope.Status = response.data.Status.toString();
                    $scope.ID = response.data.ID;
                    $scope.BookID = response.data.BookID;
                    $scope.PersonID = response.data.PersonID;
                });
        };



        $scope.ShowPopup = function () {
            $("#bookSavePopup").show();
        }
        $scope.UpdatePopUp = function (id) {
            $("#ModalUpdate").show();
            $scope.selectedBook(id);
        }

        $scope.HidePopup = function () {
            $("#bookSavePopup").hide();
            $scope.clearPopUp();
        }
        $scope.HideUpdatePopup = function () {
            $("#ModalUpdate").hide();
            $scope.clearPopUp();
        }

        $(document).ready(function () {
            $("#bookSavePopup").hide();
            $("#ModalUpdate").hide();
            $scope.clear();
            $scope.clearPopUp();
        });



        $scope.clear = function () {
            $scope.Name = "";
            $scope.SurName = "";
            $scope.TC = "";
            $scope.ISBN = "";
            $scope.BookName = "";
            $scope.PurchaseDate = new Date();
            $scope.DeliveryDate = "";
            $scope.Status = "";     
            $scope.ID = 0;
            $scope.BookID = 0;
            $scope.PersonID = 0;
        };

        $scope.clearPopUp = function () {
            $("#txtName").val('');
            $("#txtSurname").val('');
            $("#txtTC").val('');
            $("#txtBookName").val('');
            $("#txtISBN").val('');
            $("#datetimepicker3").val('');
            $("#Updatedatetimepicker4").val('');
        };


    });