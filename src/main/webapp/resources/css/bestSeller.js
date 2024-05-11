/**
 * 
 */
function getBooksByGenre(genreId, name) {
    	console.log('2.장르별 책 목록 요청 중');
    	alert('3.장르아이디 : '+genreId+', 장르명 : '+name);
    	console.log('4.카테고리아이디 : ' + genreId + ' / 카테고리명 : '+name);
    	
        $.ajax({
            url: '/bc/getBooks', 
            method: 'GET', 
            data: { genreId: genreId },
            success: function(response) {
                /* $('bs').html(response);
                $('body').html(response); */
                $('.bs').html(response);
                $('.bsSpan').html(name);
                               
            },
            
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }